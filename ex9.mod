# Curve fitting

param n_samples;

set Samples = 1..n_samples;

param x_sample{Samples};
param y_sample{Samples};

var b;
var a;
var t >= 0;
var d{Samples};

# minimize AE: sum{i in Points} | y_sample[i] - (b * x_sample[i] + a) |

minimize obj: t;

subject to def_diff{i in Samples}: d[i] = y_sample[i] - (b * x_sample[i]+a);
#subject to def_diff{i in Samples}: d[i] = 1;

subject to absolute_value_left: t >= sum{i in Samples}d[i];
subject to absolute_value_right: sum{i in Samples} d[i] >= -t;
