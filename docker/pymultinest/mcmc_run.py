#!/bin/env python3
import os
import argparse
import datetime
from my_fit_code import *
from pymultinest.solve import solve
from mpi4py import MPI

parser = argparse.ArgumentParser()
parser.add_argument("-t", "--evidence_tolerance", help="Multinest evidence tolerance factor (default: %(default)s)", type=float, default=0.5, metavar="tol")
parser.add_argument("-p", "--live_points", help="Multinest number of live points (default: %(default)s)", type=int, default=400, metavar="pts")
args = parser.parse_args()
tol, pts = args.evidence_tolerance, args.live_points


n_params = len(params)
prefix = "output/1-"

try:
    os.mkdir("output")
except FileExistsError:
    pass

with open(prefix + ".info", "w") as f:
    f.write(f"# Ran with evidence_tolerance = {tol}, n_live_points = {pts}\n")
    for i, (name, tex) in enumerate(params.items()):
        f.write(f"lab{i+1}={tex}\n")
        
MPI_PROCESSES = MPI.COMM_WORLD.Get_size()
# Only print status updates on one process if using MPI
if MPI_PROCESSES == 1:
    print("Not using MPI")
    OUTPUT = True
else:
    if MPI.COMM_WORLD.Get_rank() == 0:
        print(f"Using MPI with {MPI_PROCESSES} processes")
        OUTPUT = True
    else:
        OUTPUT = False

if OUTPUT:
    print("Started at", datetime.datetime.now().astimezone().replace(microsecond=0).isoformat())
    print(f"Running with evidence_tolerance = {tol}, n_live_points = {pts}")

# run MultiNest
result = solve(LogLikelihood=my_loglikelihood, Prior=my_prior, n_dims=n_params,
               evidence_tolerance=tol, n_live_points = pts,
               outputfiles_basename=prefix, verbose=True)

if OUTPUT:
    print('parameter values:')
    for name, col in zip(params.keys(), result['samples'].transpose()):
        print('%15s : %.3f +- %.3f' % (name, col.mean(), col.std()))
    print("Finished at", datetime.datetime.now().astimezone().replace(microsecond=0).isoformat())
