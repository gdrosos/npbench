#!/bin/bash

# Define configurations
confs=("numpy" "numba" "pythran" "dace_cpu")
benchmark=${1:-gemver}
num_threads=$(nproc)

# Set threading environment variables
export OMP_NUM_THREADS=$num_threads
export OPENBLAS_NUM_THREADS=$num_threads
export MKL_NUM_THREADS=$num_threads
export NUMEXPR_NUM_THREADS=$num_threads

# Loop through configurations and numeric ranges
for conf in "${confs[@]}"; do
    for num in $(seq 1000 1000 14000); do
        python3 run_benchmark.py -b "$benchmark" -f "$conf" -p "$num"
    done
done
python3 store_results.py