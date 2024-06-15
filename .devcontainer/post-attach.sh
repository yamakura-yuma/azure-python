#!/bin/bash

# [deplicated] poetry
# poetry install --no-root

# rye + uv
rye config --set-bool behavior.global-python=true
rye config --set-bool behavior.use-uv=true
rye sync
