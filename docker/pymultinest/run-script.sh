#/bin/bash

mpiexec -n "$1" python3 mcmc_run.py | tee multinest_output.log
