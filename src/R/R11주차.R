x <- c(0, 2, 3, 4, 5)
# ifelse 문 
ifelse(x %% 2 == 0, "even", "odd") # 벡터안에서 조건문을 Loop 없이 돌리는 좋은 함수
ifelse(x %% 2 != 0, "odd",ifelse(x==0,"zero","even")) # 벡터안에서 조건문을 Loop 없이 돌리는 좋은 함수

# 데이터 프레임에서 조건문 
d <- data.frame(x=c(1, 2, 3, 4, 5), y=c("a", "b", "c", "d", "e"))
d[c(TRUE, FALSE, TRUE, FALSE, TRUE), ]

# NA 연산 
NA & TRUE
NA + 1
sum(c(1, 2, 3, NA)) # R의 결측치 처리법: R의 함수는 NA 들어가면 Return 값이 NA인 경우가 많다. 
sum(c(1, 2, 3, NA), na.rm=TRUE) # NA.RM=TURE RM=REMOVE!!!


x <- data.frame(a=c(1, 2, 3), b=c("a", NA , "c"), c=c("a", "b", NA))
x
na.fail(x)     # NA가 포함되어 있으므로 실패
na.omit(x)     # NA가 포함된 행을 제외
na.exclude(x)  # NA가 포함된 행을 제외, 예측 잔차 구할때 다르다. 
na.pass(x)     # NA의 여부에 상관없이 통과



a <- 1:5
sqrt(a)
exp(a)

out <- (a + sqrt(a))/(exp(2)+1)
out # 벡터화된 연산 
x1 <- seq(-2, 4, by = .5) # 등차수열만들기 
floor(x1) # 내림

a <- c(1,-2,3,-4)
b <- c(-1,2,-3,4)
min(a,b)
pmin(a,b) # 벡터화된 minimum 값을 계산한다


#파이썬은 들여쓰기를 통한 구분, R은 중괄호를 통한 구분
# R은 일반괄호를 써서 조건을 명시화 한다. 

# Create vector quantity
quantity <-  15
# Set the is-else statement
if (quantity > 20) {
  print('You sold a lot!')
} else {
  print('Not enough for today')  
}


quantity <-  25
# Create multiple condition statement: elseif (파이썬 elif )
if (quantity <20) {
  print('Not enough for today')
} else if (quantity > 20  &quantity <= 30) {
  print('Average day')
} else {
  print('What a great day!')
}

# Create fruit vector
fruit <- c('Apple', 'Orange', 'Passion fruit', 'Banana')
# Create the for statement
for ( i in fruit){ 
  print(i)
}

# case 1 R은 indexing 상 처음하고 끝을 다 포함한다. 
for ( i in 1:4){ 
  print(fruit[i])
}

x<-matrix(1:6,2,3)
for ( i in 1:2){
  for (j in 1:3) {
    print(x[i,j])
  }
}


# Create a list with three vectors
fruit <- list(Basket = c('Apple', 'Orange', 'Passion fruit', 'Banana'), 
              Money = c(10, 12, 15), purchase = FALSE)
for (p  in fruit) {print(p)}





z<-11 # initial value 

while(z>=3 && z<=10){
  print(z)
  coin<-rbinom(1,1,0.5) # draw 0 or 1 with 50% chance
  
  if(coin==1){
    z<-z+1
  } else {
    z<-z-1
  }
}


z<-0 # initial value 

repeat { #조건이 없다.
  print(z)
  coin<-rbinom(1,1,0.5) # draw 0 or 1 with 50% chance
  if(coin==1){
    z<-z+1
  } else {
    z<-z-1
  }
  if (!(z>=3 && z<=10)) {
    break
  }
}


for (i in 1:22) {
  if(i<=20){
    next
    ## Skip initial 20 iterations
  }
  print(i)
  
}
# 인풋이 없는 함수 
f1 <- function() {
  cat("Hello, world\n") # 함수 Body
}
f1()
f1("kim")

f2 <- function(num) {
  for(i in seq_len(num)) {
    cat("Hello, world!\n")
  }
}
f2(3)
f2(10)
f2(10,20)
f2()

f2 <- function(num=3) {
  for(i in seq_len(num)) {
    cat("Hello, world!\n")
  }
}
f2() # 디폴트값 제공으로 자동 연산 가능 

# 가변인자의 활용 
f <- function(...) {
  args <- list(...)
  for (a in args) {
    print(a)
  }
}
f("a")
f("b","a")


# output, "BAD!!!!"
add2<-function(a,b){
  print(a+b)
  a-b
}

sum35=add2(3,5)
sum35
# return을 명시해 주는 것이 당연히 당연히 당연히 좋다. 
add2<-function(a,b){
  print(a+b)
  return(a-b)
}
sum35=add2(3,5)
sum35

# Return 값의 특징:값이 하나여야 한다. 
plus_minus<-function(a,b){
  p=a+b
  m=a-b
  result=list(p=p,m=m) # 결과값은 리스트 형태로 반환 
  return(result)

}
plus_minus(3,4)

# 함수는 minimal: 추가 input하고 output은 기능을 이해하는데 매우 부적절
# 함수는 블랙박스이고, 블랙박스란것에 대해서 오해를 줄이려면 미니멀 해야
add3<-function(a,b,c){
  print(a+b)
}

# 파이썬하고 동일, 키워드 변수 사용법 
add4<-function(a,b) {
  print(2*a-b)
}  
add4(3,2)
add4(2,3)
add4(b=2,a=3)

# 함수의 스코프 계산은 r이나 파이썬이 동일

rm(list = ls())

