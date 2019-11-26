#!/bin/bash
riscv64-linux-gnu-g++ ./examples/Robot1/main.cpp -I  ./include/  -static -o3 -o kalman.rv
export ESESC_BenchName='./kalman.rv'

case "$1" in
	-fixed)
		echo "---------------------------"
		echo "Running Emulator with FIXES"
		echo "---------------------------"
		export ESESC_IL1_core_bsize=64
		export ESESC_IL1_core_assoc=8
		export ESESC_PrivL2_bsize=128
		export ESESC_PrivL2_assoc=16
		break
		;;
	-fixedl3)
		echo "---------------------------"
		echo "Running Emulator with FIXES and adding L3 cache"
		echo "---------------------------"
		export ESESC_IL1_core_bsize=64
		export ESESC_IL1_core_assoc=8
		export ESESC_PrivL2_bsize=128
		export ESESC_PrivL2_assoc=16
		export ESESC_PrivL2_lowerLevel="L3Cache L3 shared"
		break
		;;
	esac

../main/esesc
./scripts/report.pl -last