# Testing to see how much overhead Go shared libraries have

Two `add` functions are written in Go and C. They are compiled in
shared objects. Then a C programs invokes these function a number of
times, passed as a CLI argument.

`make run` have it run 10, 10 000, 1 000 000 and 2 000 000. The `time`
command is used to compute runtime length.

# Result

With 1.18, and Apple clang version 12.0.5, on a 2019 MacBook Pro:

```
time ./main_with_c 10
        0.00 real         0.00 user         0.00 sys
time ./main_with_go 10
        0.00 real         0.00 user         0.00 sys
echo

time ./main_with_c 100000
        0.00 real         0.00 user         0.00 sys
time ./main_with_go 100000
        0.95 real         0.26 user         0.72 sys
echo

time ./main_with_c 1000000
        0.03 real         0.02 user         0.00 sys
time ./main_with_go 1000000
        9.12 real         2.55 user         6.90 sys
echo

time ./main_with_c 2000000
        0.05 real         0.05 user         0.00 sys
time ./main_with_go 2000000
       18.28 real         5.05 user        13.86 sys
```
