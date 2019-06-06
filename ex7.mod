set Items; # Monet, Bust ...

param value{Items};

var son0_items{Items} binary; # Items inherited by son 0
var son1_items{Items} binary; # Items inherited by son 1

minimize heritages_difference: (sum{i in Items} son0_items[i]*value[i]) - (sum{i in Items} son1_items[i]*value[i]);

subject to each_item_must_be_inherited_once{i in Items}: son0_items[i] and son1_items[i] == 0;
subject to each_item_must_be_inherited{i in Items}: son0_items[i] or son1_items[i] == 1;
