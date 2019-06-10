set terminal png
set output "ex9c.png"
plot "ex9.data", 0.125*x**2 - 0.625*x + 2.475
#pause -1
