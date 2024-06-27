setwd("C:/Users/CHEMISTRYMASTER/Desktop/RProjects/array")
rm(list = ls())

# 向量创建：用c()
arr1 <- c(1, 2, 3, 4, 5)  # 直接创建，用逗号分隔
arr2 <- c(1:5)  # 以一个区间的整数创建
arr3 <- c("hello", "world", "welcome", "to", "R", "studio") # 创建字符型变量组成的向量（若有其他种类混入，则一并变为字符型）
arr4 <- c(TRUE, FALSE, T, F)  # 创建布尔型变量组成的向量（可简写为T、F）

# 向量的索引
print(arr1[3])        # 一般索引：从1开始！！！
print(arr4[c(1, 3)])  # 一次取多个：参数为c()
print(arr4[1:3])      # 一次取多个：连续取多个

# 向量的更改
arr1[2] <- 10        # 一般修改
print(arr1)
arr2[c(2, 5)] <- 30  # 一次改多个：参数为c()
print(arr2)

# 向量的删除
print(arr1[-1])   # 一般删除：直接用负数索引，返回绝对值对应项删除后的数组
print(arr1)       # 一般删除：索引后不改变原数组
arr5 <- arr1[-1]  # 一般删除：索引后赋给其他数组，其他数组改变不影响原数组
print(arr5)
print(arr1)
arr5 <- arr5[-1]
print(arr5)
print(arr1)
arr6 <- arr3[c(-1, -3)]  # 一次删多个：参数为c()，里面是要删除项下标的相反数排列
print(arr6)
arr6 <- arr3[-c(1, 3)]   # 一次删多个：可以把负号提到c()外面
print(arr6)
print(arr3[-c(-1, -3)])  # 可以负负得正，但此时为正数，是索引
# print(arr3[-c(1, -3)])   切勿正负混合，会报错

# 向量的添加
arr7 <- c(arr3[1:3], "$$$", arr3[3:6])  # 直接用c()进行切片并拼接
print(arr7)

# 向量长度获取
print(length(arr7))

# 空向量：使用vector()（可指定类型和长度，各类型有对应的初值）
defaultL <- vector(mode = "logical", length = 5)
print(defaultL)
defaultN <- vector(mode = "numeric", length = 5)
print(defaultN)
defaultC <- vector(mode = "character", length = 5)
print(defaultC)

# 向量的计算（长度不同时循环补齐）：
print(c(3, 5) + c(4, 8))   # 加法：对应位相加
print(c(3, 5) * c(4, 8))   # 乘法：对应位相乘
print(c(4, 6) %% c(2, 5))  # 取余：对应位取左值除右值的余数

# seq()用法
print(seq(from = 1, to = 5, by = 2))  # 起点、终点、步长
print(seq(1, 5, 2))  # 前一种的简要写法
print(seq(from = 10, to = 20, length.out = 11))  # 起点、终点、包括起终点在内的取值数量

# rep()
print(rep(arr3, time = 2))  # 将整个数组循环n次
print(rep(arr3, 2))         # 不写默认为time
print(rep(arr3, each = 2))  # 数组内每个元素循环n次后，才到下一元素

# all()、any()
prime1 <- all(arr3 != "")  # 若向量中每一个元素都满足条件，返回真
prime2 <- any(arr2 == 30)  # 若向量中至少有一个元素满足条件，返回真

# match(A, B)：判断A的元素在B中有没有，有则返回A对应元素在B中的下标
matchRes <- match(c(1, 2, 3, 4, 5, 6, 7, 8, 9), c(1, 3, 5, 7, 9))

# NA、NULL
nRes1 <- mean(c(1, 3, 5, 7, 9, NA))    # 会返回NA，因为NA算一个数，只是不知道值
nRes2 <- mean(c(1, 3, 5, 7, 9, NULL))  # NULL会被忽略，因为NULL代表空

# 向量的筛选
selectRes1 <- which(arr2 == 30)    # which()返回下标，忽略NA
selectRes2 <- which(matchRes > 2)
selectRes3 <- matchRes[matchRes > 2]  # 直接方括号索引返回元素，不忽略NA
selectRes4 <- subset(matchRes, matchRes > 2)  # subset()返回元素，忽略NA
selectRes5 <- ifelse(arr2 == 30, T, F)  # ifelse()根据满不满足条件在对应位置填上不同值

save.image("./array.Rdata")