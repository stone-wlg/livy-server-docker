#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

docker build -t stonewlg/livy:0.7.0-spark2.4.7 .