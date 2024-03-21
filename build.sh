#!/bin/bash
nasm -f elf64 rebooter.nsm
ld -s -o rebooter rebooter.o 
