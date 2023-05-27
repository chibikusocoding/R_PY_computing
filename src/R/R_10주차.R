# R은 통계 프로그램에서 시작
#->인덱스 1로 시작하고 
#->다양한 통계 요약 기능이 있다. 
#-> 행렬기반이 연산이 기본이다. 
# 엑셀과 같은 기능이 수월: dplyr 라이브러리
# 변수 불러들이는게 자유롭다 
# 그룹 분석등이 쉽다. 
# ctrl+enter: line by line 실행 

a=c(1,2,3,4)
# 행벡터 하나 만든다. 
a[1] # 파이썬하고 차이가 있다. 
b=matrix(c(1,2,3,4),nrow=2,,ncol=2) # numpy 없이
b
iris
# Rregression
result=lm("Sepal.Length~Sepal.Width+Species",data=iris)
summary(result)


b
colnames(b)=c("john","tom")
rownames(b)=c("mid","final")
b[1,"john"] #loc하고 iloc mix 사용 가능

names(a)=c("john","tom","mary","jane")
a
a[1]
a["tom"] # 딕셔너리 기능이 필요 없다. 

# R은 Python  관점에서 보자면
# 디폴트가 numpy, pandas, stats가 합쳐진 그런 느낌이다.  
iris[1:3,"Species"] # 데이터 프레임 

# 벡터와 리스트의 차이?
#-> 인덱스 기반은 동일
#-> 벡터는 동일자료형이 원칙
#-> 리스트는 이형자료형도 가능 
a=c(TRUE,1,"python")
# True는 논리형 연산자-> 문자 강제 변환
# 1은 수치형인데 -> 문자로 강제 변환 
class(a) # 자료형 파악해주는 명령어 

# list는 list란 명령어를 통해서 만듦
list1 <- list(c(2,5,3), 21.3,sin)
list1

# 행렬만들기 
M = matrix(c('a','a','b','c','b','a'),nrow = 2, ncol = 3,byrow = T)
class(M)

A=array(1:12, dim=c(3, 4))
dim(A)
# A에 dim이 있는줄 어떻게 아나요?
str(A) # 구조를 본다. 

# Drill 1001
x <- array(1:12, dim=c(2, 2, 3))
x
x[1, 1, 1]
x[1, 2, 3]
x[, , 3] # 전체 확인-> 공란으로 남긴다.  
dim(x)

str(iris)
nlevels(iris$Species) #그룹이 몇개냐 결정 


# Drill 1002
# 벡터 만들기
apple_colors <- c('green','green','yellow','red','red','red','green')

# 팩터 객체 만들기
factor_apple <- factor(apple_colors)

# 팩터 출력하기
print(factor_apple)

# nlevels 함수를 사용하여 서로 다른 값의 개수를 알 수 있음
print(nlevels(factor_apple))

# Drill 1003

# 데이터 프레임 만들기
BMI <- data.frame(
  gender = c("Male", "Male","Female"),  height = c(152, 171.5, 165), 
  weight = c(81,93, 78), Age = c(42,38,26) )
print(BMI)

# NA 관련 명령어
x<-c(1,2,NA)
bad<-is.na(x)
bad
!bad # !는 NOT의 의미 
x[!bad] # True/False라는 논리연산을 
# 통해서 데이터 선택 가능 
# complete.cases # 결측치 없는애들만 모은다
x<-c(1,2,NA,3)
y<-c(1,NA,3,4)
good<-complete.cases(x,y)
good

df=data.frame(x,y) #Column 이름을 특정하지 않으면 
# 변수명으로 원변수의 이름이 사용 
df
df[complete.cases(df),] # 결측치 제거법 

# R하고 파이썬 인덱스 차이 
# R에서는 1:3-> 1,2,3 
# Python에서는 1:3-> 1,2 

seq(4,10,2) # R에서는 끝점이 들어간다.
rep(1:2, times=5) # each =1
rep(1:2, each=5) # times =1
rep(1:2, each=5,times=2) # each가 우선 



x<-list(foo=1:2, bar=0.6, bax="hello")
x
class(x[1]) # 대괄호 하나는 데이터 형태 유지
x[[1]] # 요소만 받아라: 벡터 
class(x[[1]])
x$foo #<->x[[1]] 과 동일, 두번괄호->수치형 벡터
x['foo'] # x[1]과 동일, 자료형유지->리스트 
x[["foo"]] #<->x$foo
x[c(1,3)] # 첫번째, 세번째를 뽑자 

result
summary_result=summary(result)
str(summary_result)  
summary_result$coefficients 
# R에서 리스트는 제한적으로 쓰이나, 
# 함수의 결과값을 정리할때 많이 쓰인다.

x<-list(a=list(10,12,14), b=c(3.3, 2.8), c=c(3,3))
x
x[c(1,3)]
x[[c(1,3)]] # 이중 인덱스, 쓰지말자 
x[[1]][[3]] # 의미가 명확 

x<-matrix(1:12,4,3)
x
x[c(1,2),c(1,3)]

# 열벡터로 뽑기
x<-matrix(1:12,4,3)
x[,2] # 행벡터로 뽑힌다. 
class(x[,2]) # 수치형 벡터 
x[,2, drop=FALSE] # 열벡터로 뽑자
class(x[,2, drop=FALSE]) # 행렬로 인식


x<-1:4  
y<-1:4

x==y
identical(x,y) # 전체 비교 

# membership: python in 
"a" %in% c("a", "b", "c")
"d" %in% c("a", "b", "c")


x <- c(1, 2, 3, 4)
x+1
y <- c(1,3) # rep times 2를 해서 덧셈 
x+y # 연산은 말이 안되나 R음 계산 


#%*% # 행렬 곱 

A=matrix(1:9,3,3)    
A
B=matrix(1:6,3,2)
B
A*B
A%*%B # 행렬곱 
t(B) # 전치행렬



