setwd("C:/Users/CHEMISTRYMASTER/Desktop/RProjects/frame")
rm(list = ls())

# 数据框的创建：每列的命名同列表
data1 <- data.frame(
  "学号" = c(2151294, 2151298, 2151299, 2151300),
  "姓名" = c("musk", "susk", "ysk", "david"),
  "学院" = c("软", "软", "软", "软"))

# 数据框的索引
# 1.索引整个组件（返回一个只有1列的数据框）
component1 <- data1["学号"]  # 用标签取
component2 <- data1[2]       # 用下标取
# 2.索引组件中的内容（根据数据类型返回一个向量）
component3 <- data1$姓名        # 数据框名$标签
component4 <- data1[["学院"]]   # 用双中括号+标签取
component5 <- data1[[3]]        # 用双中括号+下标取
# 3.索引若干行、若干列
print(data1[, c(1, 3)])                      # 索引若干列，行可省（反之，列可省）
print(data1[, c("学号", "姓名")])            # 索引可用下标或标签
print(data1[c(1, 2, 4), c("学号", "姓名")])  # 索引若干行和列相交的区域

# 列名查看：colnames()
col.name1 <- colnames(data1)           # 返回全部列名的向量
col.name2 <- colnames(data1)[1]        # 按下标取1个
col.name3 <- colnames(data1)[c(1, 2)]  # 按下标取若干个
# col.name <- colnames(data1)["学号"]  # 不能用列名本身索引，否则返回NA

# 列名修改：colnames()
data2 <- data1
colnames(data2)[1] <- "number"  # 修改一个：赋值给下标
data3 <- data1
colnames(data3) <- c("number", "name", "college")  # 全部修改：将向量赋值，少的用NA填补

# 行名查看：row.names()
row.name1 <- row.names(data1)           # 返回全部列名的向量
row.name2 <- row.names(data1)[1]        # 按下标取1个
row.name3 <- row.names(data1)[c(1, 2)]  # 按下标取若干个
# row.name <- row.names(data1)["1"]  # 不能用行名本身索引，否则返回NA

# 行名修改：row.names()
data4 <- data1
row.names(data4)[1] <- "r1"  # 修改一个：赋值给下标
data5 <- data1
row.names(data5) <- c("r1", "r2", "r3", "r4")  # 全部修改：将向量赋值，且长度必须一致，否则报错

# 数据框的增加
# 1.增加列：cbind()
#   新增的可以是一个向量，但长度必须与当前行数一致
score <- c(100, 100, 100, 100)
data6 <- cbind(data1, score)
# 2.增加行：rbind()
#   新增的必须是一个数据框或列表，且长度必须与当前列数一致
new.student <- data.frame("学号" = 2159999, "姓名" = "WTF", "学院" = "计", "score" = 99)
data7 <- rbind(data6, new.student)

# 数据框的删除
# 1.负索引
data8 <- data7[-2,]     # 删除某一行
data9 <- data7[-2, -3]  # 删除某一行和某一列
# 2.赋NULL
data10 <- data7
data10[2,] <- NA          # 只能把所有数据变成NA，不能删除（用NULL报错）
data10[, 2] <- NULL       # 删除某一列（用下标取）
data10[, "学号"] <- NULL  # 删除某一列（用标签取）
# 其余删除多行、多列、负号位置等也与矩阵操作相同

# 数据框的融合（相同数数据列只保留一个）
data11 <- merge(data1, data6)  # 和表的连接类似，保留的加all.y = TRUE

# 数据框的分组：aggregate()
# 1.一般分组
# aggregate(数据框名, list(数据框名$分组列名), 对其余列的操作)
# 2.选择特定列分组
# aggregate(数据框名[, c(特定列)], list(数据框名$列名1, 数据框名$列名2...), 对其余列的操作)


# 查看相关信息
print(attributes(data1))
print(mode(data1))
print(class(data1))
print(is.data.frame(data1))

save.image("./frame.Rdata")