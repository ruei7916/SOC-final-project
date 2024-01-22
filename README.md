# WorkLoad Optimize SOC (WLOS) Baseline

### Simulation for all workload
```sh
cd ~/SOC-final-project/testbench/all
source run_clean
source run_sim
```

### Simulation for matrix multiplication(software)
```sh
cd ~/SOC-final-project/testbench/counter_la_mm
source run_clean
source run_sim
```

### Simulation for FIR(software)
```sh
cd ~/SOC-final-project/testbench/counter_la_fir
source run_clean
source run_sim
```

### Simulation for qsort(software)
```sh
cd ~/SOC-final-project/testbench/counter_la_qs
source run_clean
source run_sim
```

### Simulation for uart(software)
```sh
cd ~/SOC-final-project/testbench/uart
source run_clean
source run_sim
```

## Verification with Vivado
### Synthesis and Generate bitstream
```sh
cd ~/SOC-final-project/vivado
source run_vivado
```


