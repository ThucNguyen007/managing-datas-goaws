#!/bin/bash

GOOS=linux go build -o main main.go
zip GetOne.zip main
rm -rf main