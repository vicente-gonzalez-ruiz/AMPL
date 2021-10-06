set Products; # Steel, Engines, E_components, Plastics

param profit{Products};
param used{Products, Products};
param unit_cost{Products};
param unit_WL{Products};
param K;

var x{Products} >= 0; # The amount of product i to be produced

maximize the_profit: sum{i in Products} (profit[i]*(x[i] - (sum{j in Products} x[j]*used[j,i])) - unit_cost[i]*x[i]);

subject to max_steel_production: x['Steel'] <= 650*K;
subject to max_plastics_production: x['Plastics'] <= 60*K;
subject to max_available_WL: sum{i in Products} unit_WL[i]*x[i] <= 830*K;
subject to min_product_amount{i in Products}: x[i] >= sum{j in Products} x[j]*used[j,i];
