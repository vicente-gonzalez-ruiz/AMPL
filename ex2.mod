set Inventories;
set Shops;

param capacity{Inventories};
param demand{Shops};
param transportation_prices{Inventories, Shops};

var x{Inventories, Shops} >= 0;

minimize cost: sum{i in Inventories, j in Shops} transportation_prices[i, j] * x[i, j];
subject to Capacity{i in Inventories}: sum{j in Shops} x[i, j] <= capacity[i];
subject to Demand{j in Shops}: sum{i in Inventories} x[i, j] = demand[j];
