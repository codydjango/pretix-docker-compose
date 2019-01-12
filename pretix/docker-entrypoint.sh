#!/usr/bin/env bash

echo "Sleep to avoid race condition with db"
sleep 2

python3 server.py