#!/usr/bin/env bash

seq 5 11 | parallel echo -m worldparams{} -e extraparams -K {} | xargs -P5 -n6 structure

