%initializing matrix
A = sym([6 -2 3;-2 8 1;3 1 7]);
b = sym([11;-9;9]);
x = sym([0; 0; 0]);

%initializing d and r
r = sym(-b + A * x);
d = sym(-r);

for m = 1:3
    r_norm = sym(norm(r));
    lamda = sym(r_norm^2 / (d.' * A * d)) %step 1
    x = sym(x + lamda * d) %step 2
    r = sym(r + lamda * A * d) %step 3
    rm_norm = sym(norm(r));
    beta = sym(rm_norm^2 / r_norm^2) %step 4
    d = sym(-r + beta * d) %step 5
end