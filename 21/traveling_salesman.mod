# traveling_salesman.mod

param n integer, default 3;

set V := 1..n;

param k := 2^n - 2;
set S{i in 1..k} := {j in V: (i div 2^(j-1)) mod 2 = 1}; # We have 1 in j-position 
#param k default 0;
#set S{i in 1..k} default{};


param c{V,V};

var x{V,V} binary;

minimize objective: sum{i in V, j in V} c[i,j]*x[i,j];
subject to one_coming{i in V}: sum{j in V: i != j} x[i,j] = 1;
subject to one_going{j in V}: sum{i in V: i != j} x[i,j] = 1;
subject to circle{i in 1..k}: sum{j in S[i], l in V diff S[i]} x[j,l] >= 1;  