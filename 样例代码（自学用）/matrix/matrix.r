setwd("C:/Users/CHEMISTRYMASTER/Desktop/RProjects/matrix")
rm(list = ls())

# 矩阵创建
# 一、matrix()
data1 <- matrix(data = c(1:12),  # 数据，缺失时所有数据为NA
                nrow = 3,        # 行数
                ncol = 4,        # 列数
                byrow = TRUE,    # 是否一行一行排，若为FALSE则一列一列排（默认FALSE）
                dimnames = list(c("r1", "r2", "r3"), c("c1", "c2", "c3", "c4")))  # 行列名
                # 命名还有以下形式：
                # 1.dimnames(data1) <- list(c("r1", "r2", "r3"), c("c1", "c2", "c3", "c4"))
                # 2.rownames(data1) <- c("r1", "r2", "r3")
                #   colnames(data1) <- c("c1", "c2", "c3", "c4")
# 二、rbind()、cbind()
data2 <- rbind(c(1, 2, 3), c(4, 5, 6))  # 把每个向量当一行，叠成矩阵
data3 <- cbind(c(1, 2, 3), c(4, 5, 6))  # 把每个向量当一列，叠成矩阵
# 三、强制转换
data4 <- as.matrix(c(1, 2, 3, 4))  # 将一个向量转成一列的矩阵

# 矩阵索引
data5 <- matrix(c(1:25), 5, 5)
print(data5[3, ])  # 取某一行
print(data5[, 4])  # 取某一列
print(data5[3, , drop = FALSE])  # 取行、列时不降维
print(data5[3, 4])  # 取某一个
print(data5[c(1, 3), c(2, 4)])  # 取若干行、若干列相交区域的数据
print(data1["r2", "c3"])  # 行列有命名的矩阵中，用名字取
# 同时可以将方括号中的数字、向量取负，达到排除若干元素的目的

# 矩阵转置：用t()
data6 <- t(data5)

# 矩阵拼接：rbind()、cbind()
m1 <- matrix(c(1:4), 2, 2)
m2 <- matrix(c(5:8), 2, 2)
m.bind1 <- rbind(m1, m2)  # 左右拼在一起
m.bind2 <- cbind(m1, m2)  # 上下拼在一起

# 行列数据操作：返回一个向量
print(rowSums(data1))   # 各行求和
print(rowMeans(data1))  # 各行求均值
print(colSums(data1))   # 各列求和
print(colMeans(data1))  # 各列求均值

# 计算行列式：det()
print(det(data5))

# 矩阵相乘：%*%
mul.result <- data5 %*% data5

# 每行/每列调用的函数：apply()
# 参数为：矩阵、dimcode（1为行，2为列）、每行调用的函数
row.avg <- apply(data5, 1, mean)  # 每行调用一次mean，各有一个平均值，返回为向量
col.avg <- apply(data5, 2, mean)  # 每列调用一次mean，各有一个平均值，返回为向量

# 查看数据结构
ds1 <- class(data5)    # 矩阵的结果有matrix
ds2 <- class(row.avg)  # 向量的结果仅是向量元素的类型

# 检查是否为矩阵
# 1.attributes()：矩阵返回行数和列数，否则返回NULL
print(attributes(data5))
print(attributes(row.avg))
# 2.is.matrix()：返回逻辑值
print(is.matrix(data5))
print(is.matrix(row.avg))

save.image("./matrix.Rdata")