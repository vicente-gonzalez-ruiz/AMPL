set Prod;
param maxval{Prod};
param b;
param onehour{Prod};
param p{Prod};
var x{Prod}>=0;
maximize profit: sum{i in Prod} p[i]*x[i];
subject to maxvalues{i in Prod}: x[i]<= maxval[i];
subject to hours: sum{i in Prod} x[i]/onehour[i]<=b;
