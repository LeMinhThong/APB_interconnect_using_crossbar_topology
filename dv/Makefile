test ?=
SEED ?= random
COMPARG ?=
RTL_ROOT ?= ../rtl

#------------------------

all:  build run

build:
	mkdir -p run_dir
	vlib work
	vlog -sv -f FILES_compile.vc +define+${COMPARG}
run:
	vsim -l ${test}.log work.${test} -do "run -all; exit" -sv_seed ${SEED}
	mv ${test}.log ./run_dir
clean:
	rm -rf *.log
	rm -rf log
	rm -rf work
	rm -rf transcript
	rm -rf vsim.wlf
