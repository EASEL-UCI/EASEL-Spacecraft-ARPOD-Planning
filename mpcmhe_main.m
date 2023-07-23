%{
    BIG TODO:
    ==========
        -> Support 2d simulation
        -> Support attitude dynamics
        -> Add in time-invariant control Disturbance and benchmark effectiveness
%}
delete("tmpC*") %delete any temporary files created
close all
clear
clc

%fixes randomness for reproducibility of any plots
rng(1);


use2D = true;
useNonlinear = true;
useAttitude = false;
mpc_horizon = 30;
mhe_horizon = 10;
total_time = 100; %total time in seconds
tstep = 1;        %each time step is 1 second

benchmark = ThrusterBenchmark;
benchmark = benchmark.init(useNonlinear, mhe_horizon, mpc_horizon, total_time, tstep, use2D, useAttitude);

noiseQ = @() [0;0;0;0];
noiseR = @() [0;0;0;0];

traj0 = [1;1;0.001;0.001];
benchmark = benchmark.runBenchmark(traj0, noiseQ, noiseR);

delete("tmpC*") %delete any temporary files created