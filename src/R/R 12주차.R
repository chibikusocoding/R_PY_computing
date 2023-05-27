# 조건문, 반복문, 함수
# 파이썬하고 달리 1부터 인덱스 시작

a=c(1,2,3,4,5)

for (aa in a) {
  print(aa)
}

for (aa in a) {
  if (aa<3 & aa>1){
  print(aa)
  } else if (aa>4) {
   print("large Number")  
  } else {
   print("soso")
  }
}
# 조건을 괄호 
# 블럭을 중괄호
# elif 대신에 elseif 
# AND OR 대신에 & |

add2<-function(a,b=2){
  result=a+b
  return(result)
}
add2(4)

add2<-function(a,b=2){
  result1=a+b
  result2=a-b
  result=list(add=result1,minus=result2)
  return(result)
}
add2(3,4)
# 반드시 하나의 결과로 Return 
# def안쓰고 -> function 
# Scope는 R이나 파이썬이나 큰차이 없다.
# 인자쓰는 것도 비슷: Keyword, Default  겂 

d <- data.frame(x=c(1, 2, 3, 4, 5),
                y=c(2, 4, 6, 8, 10),
                z=c('M', 'F', 'M', 'F', 'M'))
str(d)
summary(d)
d$x # 벡터형 환원 
d$x <- 6:10 # 변수값 바꾸기 
d
d$w <- c("A", "B", "C", "D", "E") # 새로운 변수 지정

d['x']<-10:14 # 이름기반 가능
d[3,'x']=1000 # 인덱스와 이름 섞어서 데이터 바꾸는 것 가능


x <- data.frame(1:3)
x
colnames(x) <- c('val')
x
rownames(x) <- c('a', 'b', 'c')
x
rownames(x)[2]="two names" # 인덱스 기반을 통해서 부분만 바꾸는 것 가능 
x

str(x)
x$rowname
x$colname # 구조로서의 의미가 아니라 변수명으로 사용한다.

# 비교
x$val
class(x$val)
x['val']
class(x['val'])

d <- data.frame(x=c(1, 2, 3, 4, 5), y=c(2, 4, 6, 8, 10),z=c(1,3,4,6,7))
d$x
d[1, ]
d[1, 2]

d[c(1, 3), 2]
d[-1, -2] # 파이썬하고 완전 차이......Reverse Indexing 없다. 
d[, c("x","z")]

# Loc ILOC 안따지고, 그냥 한다. 

data(USArrests)
help(USArrests) # 데이터셋 설명이 있음
str(USArrests)
summary(USArrests)
head(USArrests,3) #  Head Tail 명령어 
tail(USArrests,3) 


# Top 5 states with high murder rate
nidx <- order(USArrests$Murder, decreasing=T)[1:5]
nidx
USArrests[nidx,]


# Botton 10% states with murder rate
lidx <- (USArrests$Murder < quantile(USArrests$Murder, 0.1)) #분위수 

USArrests[ lidx,]

lidx=seq(1,50)[lidx][1:3] # 파이썬 스타일 코딩 

USArrests[c(lidx,nidx),]
nidx
lidx

# R은 Daily 데이터 분석할때 용이
# R의 단점은 multicore, GPU 쓰기가 쉽지 않다. 
data(USArrests)
help(USArrests)
quantile(USArrests$Murder)
fivenum(USArrests$Murder)

x <- data.frame(id=c(1, 2), name=c("a", "b"), stringsAsFactors=F)
x
x=rbind(x,c(3,"c")) #pd concat에 대응
x=cbind(x,greek=c("alpha","beta","gamma"))
x


iris
newdf=split(iris, iris$Species)
str(newdf)
newdf$versicolor # 부분 데이터 프레임을 추출하는게 가능 
lapply(split(iris$Sepal.Length, iris$Species), mean) # 
subset(USArrests, UrbanPop > 85 & Murder>10) # filtering 함수 
subset(USArrests, UrbanPop < 40 &  Murder < 10, select = c(Assault, Rape))

# dplyr 함수 Pipeline 연산을 써서 순서를 쉽게 확인 가능  
library(dplyr)
USArrests %>% filter(UrbanPop>85) %>% filter(Murder<10) %>% 
  select(Assault,Rape)

authors <- data.frame(
  surname = c("Tukey", "Venables", "Tierney", "Ripley", "McNeil"),
  nationality = c("US", "Australia", "US", "UK", "Australia")   )
books <- data.frame(
  name = c("Tukey", "Venables", "Tierney",
           "Ripley", "Ripley", "McNeil", "R Core"),
  title = c("Exploratory Data Analysis",
            "Modern Applied Statistics ...",
            "LISP-STAT",
            "Spatial Statistics", "Stochastic Simulation",
            "Interactive Data Analysis",
            "An Introduction to R"))

authors
books
m1 <- merge(authors, books, by.x = "surname", by.y = "name")
m1 # Inner Join 


# Which -> Find 함수 
which(iris$Species == "setosa")
which.min(iris$Sepal.Length)
which.max(iris$Sepal.Length)

# 한 데이터에 대해서 그룹 해서 계산: Pivot Table그리가
# User Written 함수 
aggregate(Sepal.Length~Species, data=iris, FUN=mean)
aggregate(Sepal.Length~Species, data=iris, FUN=sd)

# Pivot Table만 구하려면: Dplyr 계열이 직관적 
iris %>% group_by(Species) %>% 
  summarize(mean_SL=mean(Sepal.Length),sd_SL=sd(Sepal.Length))

# APPLY 함수는 LOOP를 없애주는 함수: 열연산 행연산 

d <- matrix(1:9, ncol=3, nrow=3)
d
apply(d, 1, sum) # 행에 대해서 적용 
nrow=3
ret1=rep(0,nrow)
for (ii in seq_len(nrow)){
ret1[ii]=sum(d[ii,])  
}
}
ret1
apply(d, 2, sum) %열에 대해서 적용 


iris45<-iris[1:4,1:4]
apply(iris45,2,sum)
apply(iris,2,sum) # 문자영 데이터가 있어서 안된다.

apply(iris45, 1, median) # 행축에 대해서 중간값 

# lapply Sapply는 축이 하나인 경우만 가능
x <- list(a=1:3, b=4:8)
lapply(x, mean) # 리스트 형태 반환 
lapply(iris[, 1:4], mean)

sapply(x, mean) # 벡터, 행렬, 배열, 데이터 프레임 형태로 반환
sapply(iris[, 1:4], mean)


f <-function(c,d){
  z=mean(c)
  z=z+d
}

z=lapply(iris[, 1:4],f,d=3) # Keyword 변수를 추가함으로서 함수 추가인자 가능 
unlist(z) # 벡터형태 
z # 리스트

# 그룹을 복잡하게 쓰는 연산 가능 
tapply(iris$Sepal.Length, iris$Species, mean)
tapply(iris$Sepal.Length, iris$Species, f,d=3)

m=matrix(1:8,nrow=4,ncol=2)
tapply(m, list(c(1, 1, 2, 2, 1, 1, 2, 2), c(1, 1, 1, 1, 2, 2, 2, 2)), sum)
m
# 함수를 반복하는 것 역시 가능하다..
mapply(rnorm,
       c(1, 2, 3),     # n
       c(0, 10, 100),  # mean
       c(1, 1, 1))     # sd

# APPLY 계열 함수는 루프를 안쓰게끔 하는 함수


