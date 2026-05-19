#!/usr/bin/bash

cores=$(ls cores/)

for core in $cores; do
    if [ ! -f cores/$core/reports/qor.rpt ]; then continue; fi
    delay=$(cat cores/$core/reports/qor.rpt | sed -nE "s|\s*Critical Path Length:\s*||p")
    area=$(cat cores/$core/reports/qor.rpt | sed -nE "s|\s*Cell Area:\s*||p")
    echo -e "${core}:\t${delay}ps\t${area}um^2"
done
