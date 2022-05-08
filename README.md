# Bash Trap Stack
## Purpose
The traps.sh bash shell script allows you to create a stack of commands to execute for trap.
## Commands
* traps_start - registers the exit trap
* traps_push $@ - pushes $@ as one entry to the stack
* traps_pop - pops one entry from the stack and execute
* traps_drop - pops one entry from the stack and do nothing
* traps_isEmpty - returns 0 if empty, returns 1 if not empty
* traps_stop - unregisters the exit trap if there is nothing on the stack
* traps_cancel - unregisters the exit trap and remove all entries from the stack
* traps_exit - unregisters the exit map and pops all entries from the stack
* traps_diag - print the stack on pipe 1
## User Variables
* TRAPS_DEBUG=0 - provides more verbose output on pipe 2
* TRAPS_SIGNAL=EXIT - controls the trap signal
## Typical Sequence
* traps_start
* traps_push echo "test"
* traps_pop
* traps_stop
## Notes
Tested against Bash 5.
You can use *set -eE* along with *TRAPS_SIGNAL=ERR* before you start the trap stack to get the function and line number that triggered the trap.