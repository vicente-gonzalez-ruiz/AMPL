set Items; # Monet, Bust ...

param value{Items};

var inherit{Items} binary; # = 1 if son 1 get item i, 0 otherwise
var t >= 0;
var d;

minimize obj: t;

subject to def_d: d = sum{i in Items} inherit[i]*value[i] - sum{i in Items} (1-inherit[i])*value[i];

subject to absolute_value_left: t >= d;
subject to absolute_value_right: d >= -t;
