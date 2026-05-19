#!/usr/bin/python3

import sys
import re
import os
from pathlib import Path

if len(sys.argv) < 2:
    print("usage: find_order.py <path_to_source_files>")
    exit(1)

directory = Path(sys.argv[1])

modules = {}
files = []
package_files = []

for v_file in list(directory.rglob("*.v")) + list(directory.rglob("*.sv")):
    files.append(v_file)

    content = open(v_file, "r").read()

    # Packages: compile first (independent of module dependency graph)
    if re.search(r"^\s*package\s+([A-Za-z_][A-Za-z0-9_]*)", content, flags=re.MULTILINE) is not None:
        package_files.append(v_file)

    matched_module = re.search(r"module\s+([^ \t\n\r\f\v;(]*)", content)
    if matched_module is None:
        continue

    mod = matched_module.group(1)
    modules[mod] = v_file
    print(f"found module: {mod} in {v_file}")



compile_order = []


undeclared_modules = modules.copy()
file_list_path = Path('file.lst')
file_list_dir = file_list_path.resolve().parent
file_list = open(file_list_path, 'w')

# Always write package files first to avoid "Package has not been analyzed" errors.
for pf in sorted(set(package_files)):
    rel = os.path.relpath(Path(pf).resolve(), file_list_dir)
    file_list.write(f"{rel}\n")
    if pf in files:
        files.remove(pf)

def amount_of_undeclared_modules(v_file):
    content = open(v_file, "r").read()
    ctr = 0
    for m in undeclared_modules:
        if v_file == modules[m]:
            continue
        if re.search(fr"[\s\n]*{m}[\s\n(]", content) is not None:
            print(f"found usage of {m} in {v_file}")
            ctr += 1

    return ctr

while len(files) > 0:
    undeclared_modules_per_file = {}
    for f in files:
        undeclared_modules_per_file[f] = amount_of_undeclared_modules(f)
        print(f"number of undeclared module usages for {f}: {undeclared_modules_per_file[f]}")
    

    files = sorted(files, key=lambda f: undeclared_modules_per_file[f])

    def pop_file():
        f = files[0]
        # Presto/DC resolves file list entries relative to the file list directory.
        # Use relative paths so the list works regardless of where the project is located.
        rel = os.path.relpath(Path(f).resolve(), file_list_dir)
        file_list.write(f"{rel}\n")
        files.pop(0)

    pop_file()
    while len(files) > 0 and undeclared_modules_per_file[files[0]] == 0:
        pop_file()
