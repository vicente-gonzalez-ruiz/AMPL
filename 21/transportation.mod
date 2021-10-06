# transportation.mod
param n integer, default 3;
param m integer, default 4;
set supply := 1..n;
set demand := 1..m;
param c{supply,demand};
param cap{supply};
param dem{demand};
var x{supply,demand} >= 0;
minimize objective: sum{i in supply, j in demand} c[i,j]*x[i,j];
subject to demand_satisfaction{j in demand}: sum{i in supply} x[i,j] = dem[j];
subject to capacity{i in supply}: sum{j in demand} x[i,j] <= cap[i];
