# scalar: a vector with only 1 element
#
# To created a vector we use the function "c" that stands for combined.
# Ex. 
a <- c(1:3) 
# if we want that it's print directly, I need to add an additional parenthesis 
# that has a hidden function print() in it (implicit)
(a <- c(1:3)) 
# R is case sensitive
is.numeric(a)
is.double(a)
# vector only allows one type of element, so when mix they'll coerced to the most flexible one 
# least to most flexible = logical, integer, double, character.
v_log2 = c(TRUE, FALSE, TRUE,TRUE,FALSE)
sum(v_log2)

set.seed(123) # if we set the seed, the random numbers will be the same for everyone
v_norm = rnorm(n=1000, mean = 0, sd = 2)

head(v_norm, n=10)

sum(v_norm>0)

# NA = Not Available
# list can contain any type of elements inside, thus they are RECURSIVE vectors, not atomic
l1 = list(list(1,2), c(3,4))
str(l1)
l2 = c(list(1,2), c(3,4))
str(l2)

print(l1)
print(l2)

x <- matrix (data = 1:3,
        nrow = 3, ncol = 3) # byrow = TRUE
# rownames (matrixname) <- c("row1", "row2", "row3")
# colnames (matrixname) <- c("col1", "col2", "col3")
print(x)
