# Curve fitting

param n_samples;

set Samples = 1..n_samples;

param x_sample{Samples};
param y_sample{Samples};

var b;
var a;
var c;
var t >= 0;
var d{Samples};

# minimize SAE: sum{i in Samples} | y_sample[i] - (c*x_sample[i]^2 + b*x_sample[i] + a) |
minimize SAE: sum{i in Samples} t;

subject to def_diff{i in Samples}: d[i] = y_sample[i] - (c*x_sample[i]^2 + b*x_sample[i] + a);
subject to absolute_value_left{i in Samples}: t >= d[i];
subject to absolute_value_right{i in Samples}: d[i] >= -t;
