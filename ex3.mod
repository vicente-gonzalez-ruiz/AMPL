set Products;
set Resources;

param capacity{Resources};
param gain{Products};
param used{Resources, Products};

var x{Products} >= 0 integer;

maximize profit: sum{i in Products} x[i] * gain[i];
subject to Capacity{i in Resources}: sum{j in Products} used[i, j] * x[j] <= capacity[i];

