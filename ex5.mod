set Products; # 0=A1 1=A2 2=A3
set Months;   # 0=January 1=February 2=March 3=April

param demand{Products, Months};
param unit_price{Products};
param activation_cost{Products};
param production_cost{Products};
param production_quota{Products};
param minimum_batch{Products};
param productive_days{Months};
param storage_rate{Products};

var x{Products, Months}; # Amount of product i in month j to be produced
var y{Products, Months}; # Amount of product i in month j to be sold
var t{Products, Months union {0}}; # Amount of product i in month j to be stored
var a{Products, Months} binary; # 1 if product i in month j is produced

maximize profit: sum{i in Products, j in Months} (unit_price[i]*y[i, j] - production_cost[i]*x[i, j] - storage_rate[i]*t[i, j] - activation_cost[i]*a[i, j]);

subject to positive_production{i in Products, j in Months}: x[i, j] >= 0;
subject to positive_sold{i in Products, j in Months}: y[i, j] >= 0;
subject to positive_storage{i in Products, j in Months}: t[i, j] >= 0;

subject to production_days{j in Months}: sum{i in Products} x[i, j]/production_quota[i] <= productive_days[j];

subject to total_available_volume{j in Months}: sum{i in Products} t[i, j] <= 800;

subject to max_sold{i in Products, j in Months}: y[i, j] <= demand[i, j];

subject to minimum_production{i in Products, j in Months}: minimum_batch[i]*a[i, j] <= x[i, j];

subject to maximum_production{i in Products, j in Months}: x[i, j]/(production_quota[i] * productive_days[j]) <= a[i, j];

subject to storage_remain{i in Products, j in Months}: t[i, j-1] + x[i, j] = y[i, j] + t[i, j];
subject to initial_storage{i in Products}: t[i, 0] = 0;
