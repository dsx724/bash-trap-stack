#!/bin/bash

# SPDX-License-Identifier: MIT
# Copyright (C) 2022 Da Xue

. traps.sh

TRAPS_DEBUG=1

function traps_test {
	traps_start
	traps_push "echo" "traps 1" "test 1" "drop"
	traps_push "echo" "traps 2" "test 2" "pop"
	traps_push "echo" "traps 3" "test 3" "drop"
	traps_push "echo" "traps 2" "test 2" "pop"
	traps_diag
	echo 
	traps_isEmpty && echo "Empty" || echo "Not Empty"
	echo 
	traps_drop
	traps_diag
	echo
	traps_pop
	traps_diag
	echo
	traps_drop
	traps_diag
	echo
	traps_pop
	traps_diag
	echo
	traps_stop
	echo
	traps_start
	traps_cancel
	echo
	traps_pop && echo "FAILED" || true
	traps_diag
	echo
	traps_cancel && echo "FAILED" || true
	traps_diag
	echo
	set -eE
	TRAPS_SIGNAL=ERR
	traps_start
	traps_push echo "test"
	false
}

if [ "${BASH_SOURCE[0]##*/}" = "${0##*/}" ]; then
	traps_test
fi