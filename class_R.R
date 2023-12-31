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

## MISSING VALUES

v_na = c(1,2,3,NA)
mean (v_na)
mean (v_na, na.rm = TRUE) # most math function has 'na.rm' option, but it's set to FALSE by default
# To calculate statistich function, be sure to set 'na.rm' as TRUE!
v_na = NA
v_na == NA
is.na(v_na)
which(is.na(v_na)) # it gives the position of the NA in the vector, in this case, the forth

## Factor

v_f = factor(v_seasons <- c("spring","summer","fall","winter")) # DON'T use equal sign "=" here
# This is equal to have:
# v_seasons <- c("spring","summer","fall","winter") 
# v_f = factor(v_seasons) 
# the function "factor" organized the levels in alphabetic order by default
v_f2 = factor(c("spring","fall"), levels = v_seasons)
table(v_f2)
v_f3 = ordered(c("spring","fall","summer"), levels = v_seasons)
table(v_f3)
v_f3
# ALSO... "factor" is an integer 
as.character(v_f) # if we wanted it to behave as a character 
# as.'something' means we're converting something to a different one
# In that sense, "as.integer" is also possible

## Dates
Sys.Date()

date <- as.Date("1969-09-14")
# 1970-01-01 is the default, it gives us a result of 0 in we unclass it
unclass(date) # It will tell us how many days have passed sin the default date
              # The result will be 19614 if we set it at 2023-09-14 (today's date)
              # The result will be -109 if we set it before the standard date, e.g. 1969-09-14

## Date-Times
now_ct <- as.POSIXct("2023-09-14 9:52", tz = "US/Central")
now_ct
unclass(now_ct) # We have time here so It'll tell us how many seconds have passed since the default date

## Subsetting
x = c(1,2,3,4,5)
x[c(1,5)] # Things in the square brackets tell the program the locations I want it to give me back
x[c(-1,-4)]
# We cannot mix negative and positive numbers for subsetting. e.g. x[c(-1,3)]
x[c(TRUE,FALSE,TRUE,FALSE,TRUE)]
x[c(TRUE,FALSE)] # It does a recycle process
x[x %% 2 != 0] # Modulus (x mod 2). It will give me odd numbers
               # If I want the even numbers the right notation should be "==0"
               # With the exclamation mark, it means "not equal" to 0
               # i.e. for !FALSE, the result is TRUE
x[factor("b")] # result is 1
x[factor("e")] # result is 1

# For R it doesn't really matter what number is in the position "e" or "b", 
# for it, they're all just integer 

## Lists
x = list (1:3, "a", 4:6)
x[1]
x[[1]]
x[2]
x[]
x[0]

## Matrix and Arrays

a <- matrix (1:9, nrow = 3)
colnames(a) <- c("col_1","col_2","col_3")
rownames(a) <- c("row_1","row_2","row_3")

a[1:2, ] # after the comma is empty so it will give me back "everything"
         # before the comma we have a positive integer so it will "include" the numbers I specified
a[c(TRUE,FALSE,TRUE), c("col_3","col_1")]
a[0, -2] # a zero inside the square bracket will give us "zeroness"... nothing
a[1, ]
class(a[1, ]) # R will simplify the result to the lowest level possible 
class(a)
# How to avoid this automatic simplification of the results? set drop to FALSE
# This's ONLY for matrices
a[1, , drop = FALSE]
class(a[1, , drop = FALSE])
a[]
a[c(1,5,9)] # It'll look into the matrix as it's a big vector and will subset the 1st, 5th, and 9th

a[a %% 2 == 0]
a2 = a
a2[a2 %% 2 ==0] = -1 # It'll replace all the even numbers for a -1
upper.tri(a)
a[upper.tri(a)]

(df = data.frame(x = 1:5, y = rnorm(5), z = letters[1:5]))
df[df$x ==3, ]
df$x ==3

#### CONDITIONAL STATEMENTS

### if... else...
## Syntax:
# statement is a single R statement or a compound statement 
  # (a group of R statements enclosed in curly braces { } and separated by semicolons).
    # cond is an expression that resolves to TRUE or FALSE.
    # expr is a statement that evaluates to a number or character string.
    # seq is a sequence of numbers or character strings.

# nested if else
a <- 0.33 # change it for 4, 5 and 0.33
if (a %% 2 == 0) {
  b <- a * -1
} else {
  if (a %% 2 == 1) {
    b <- a ^ 2
  } else {
    b <- a * 10
  }
}
b

# Define your own categories
small <- 1:5
medium <- 6:10
large <- 11:15

a <- 16
if (a %in% small) {
  b <- 'Small number'
} else if (a %in% medium) {
  b <- 'Medium Number'
} else if (a %in% large) {
  b <- 'Large number'
} else {
  b <- 'Number out of range'
}
b

### ifelse

## ifelse(cond, statement for TRUE, statement for FALSE)

a=0.33 # change for 5, 0.33, and 4
ifelse(a %% 2 == 0, b <- a * -1, b <- a ^ 2)

## Vectorization
# ifelse is faster than the for loop
a=c(0.33,4,5)
