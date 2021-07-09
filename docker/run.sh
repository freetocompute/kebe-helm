#!/bin/bash

minio server --console-address "$CONSOLE_ADDRESS" "$DATA_DIR"
