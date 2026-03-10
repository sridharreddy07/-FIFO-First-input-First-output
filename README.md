This code is very useful for memory read and Memory Write operations
Here Data must be written to mem, when Write Enable=1.
Both write enable and read enable cannot be active simultaneously. we can write but depends upon memory architecture. But It is illegal
After write enable pin is set to OFF. Then You can turn ON read enable pin to read data one by one.
Full pin must be Filled with data then only you can turn on Read enable pin to get d_out
