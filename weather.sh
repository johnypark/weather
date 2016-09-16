#!/bin/bash/
maxTemp= `awk -F','' '{print $2}' gnv.txt | sort -n | tail -n1`



