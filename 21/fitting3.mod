param n default 19;
set N := 1..n;
var a;
var b;
var t{N};
param x{N};
param y{N};
var z;

minimize max_dev: z;

subject to maximum{i in N}:
	z >= t[i]; 
	
subject to positive{i in N}:
	z >= y[i] - (b*x[i] + a);
	
subject to negative{i in N}:
	z >= (b*x[i] + a) - y[i];

	