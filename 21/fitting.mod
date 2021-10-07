param n default 19;
set N := 1..n;
var a;
var b;
var t{N};
param x{N};
param y{N};

minimize sum_abs_devs:
	sum{i in N} t[i]; 
	
subject to positive{i in N}:
	t[i] >= y[i] - (b*x[i] + a);
	
subject to negative{i in N}:
	t[i] >= (b*x[i] + a) - y[i];

	