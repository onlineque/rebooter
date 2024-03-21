#!/bin/bash
nasm -f elf64 rebooter.asm
ld -s -o rebooter rebooter.o 
