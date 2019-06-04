set Inventories;
set Shops;
set Nodes = Inventories union Shops;

param capacity{Inventories};
param demand{Shops};
param transportation_prices{Nodes, Nodes};

var x{Nodes, Nodes} >= 0;

minimize cost: sum{i in Nodes, j in Nodes} transportation_prices[i, j] * x[i, j];
subject to Capacity{i in Inventories}: sum{j in Nodes} x[i, j] <= sum{k in Inventories} x[k, i] + capacity[i];
subject to Demand{j in Shops}: sum{i in Nodes} x[i, j] = demand[j] + sum{k in Shops} x[j, k];
