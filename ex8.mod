# CPU scheduling

param N_processors;
param N_tasks;

set Tasks := 1..N_tasks;
set Processors := 1..N_processors;

param load{Tasks};
param speed{Processors};

var scheduling{Tasks, Processors} binary; # scheduling_ij = 1 if processor j get task i, 0 otherwise
var t >= 0;
var d{Processors, Processors};

minimize obj: t;

subject to def_d{j in Processors, k in Processors}: d[j,k] = sum{i in Tasks} scheduling[i,j]*load[i]/speed[j] - sum{i in Tasks}
scheduling[i,k]*load[i]/speed[k];

subject to absolute_value_left{j in Processors, k in Processors}: t >= d[j,k];
subject to absolute_value_right{j in Processors, k in Processors}: d[j,k] >= -t;
subject to all_tasks_must_be_run{i in Tasks}: sum{j in Processors} scheduling[i,j] = 1;