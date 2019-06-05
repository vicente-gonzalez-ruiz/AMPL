set Workers; # A B C D
set Jobs;    # 1 2 3 4

param assignment_cost{Workers, Jobs};

var x{Workers, Jobs} binary; # Who worker does which job?

minimize cost: sum{i in Workers, j in Jobs} x[i, j] * assignment_cost[i, j];
subject to at_most_only_job_per_worker_constraint{i in Workers}: sum{j in Jobs} x[i, j] = 1;
subject to at_most_only_worker_per_job_constraint{j in Jobs}: sum{i in Workers} x[i, j] = 1;
