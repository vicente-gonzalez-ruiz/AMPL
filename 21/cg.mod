param n default 5;

set N := 1..n; # Nodes
set E within {N,N}; # Edges

param m;
set M := 1..m; # set of edgesets
set Nodes{M} default {};
param c{M}; # Cost of edgesets
param a{N,N,M} binary default 0; # a[i,j,k]=1 if edge (i,j) is in edegeset k

var z{M} binary; # z[k]=1 if edgeset k is in the solution

minimize cost: sum{j in M} c[j]*z[j]; 

subject to edgecover{(i,j) in E}:
  sum{k in M} a[i,j,k]*z[k] = 1;

problem Master: z, cost, edgecover; # Variables, objetivos, restricciones

param d{E};
param pi{E} default 0;
param b;

var x{N} binary;
var y{E} binary;

minimize reduced_cost:
  sum{i in N} x[i] - sum{(i,j) in E} pi[i,j]*y[i,j];
  
subject to maxlength:
  sum{(i,j) in E} d[i,j]*y[i,j] <= b;
  
subject to xy1{(i,j) in E}:
  y[i,j] <= x[i];
  
subject to xy2{(i,j) in E}:
  y[i,j] <= x[j];
  
problem Pricing: x,y, reduced_cost, maxlength, xy1, xy2
