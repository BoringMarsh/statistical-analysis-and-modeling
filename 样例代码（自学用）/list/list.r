setwd("C:/Users/CHEMISTRYMASTER/Desktop/RProjects/list")
rm(list = ls())

# 列表创建：list()，列表由组件构成
chr <- "character"
arr <- c(1:5)
data <- matrix(c(1:12), 3, 4)
list1 <- list(chr, arr, data)
list2 <- list()  # 建立空向量

# 查看类型与数据结构（都返回"list"）
print(mode(list1))
print(class(list1))

# 给每个组件命名：在建立时，每个位置按照 组件名=组件 的方式写
# 无论组件名是什么形式，一律转为字符型
# 打印时，组件名在$符号之后
list3 <- list("组件1" = chr, "组件2" = arr, "组件3" = data)
print(list3)

# 取所有组件名：names()
list3.names <- names(list3)  # 返回字符型向量

# 删除所有组件名
# 1.unname()
list4 <- unname(list3)
# 2.names()
list5 <- list3
names(list5) <- NULL

# 更改所有组件名：names()
# 用向量赋值，可对应设置各个标签的值
# 不要用NULL，因为会被忽略
# 如下例，若向量有一个NULL两个值，则会认为只赋了两个标签值，另一个就会用NA填补
list6 <- list3
names(list6) <- c("hello", "R", "world")

# 列表的索引
# 1.索引整个组件（返回一个长度为1的列表，里面只有一个组件）
component1 <- list6["hello"]  # 用标签取（若有标签）
component2 <- list6[1]        # 用下标取
# 2.索引组件中的内容（根据组件类型返回一个对象）
component3 <- list6$hello     # 列表名$标签（若有标签）
component4 <- list6[["R"]]    # 用双中括号+标签取（若有标签）
component5 <- list6[[3]]      # 用双中括号+下标取

# 列表的添加
# 1.只加组件
list7 <- list3
list7[[10]] <- TRUE  # 双中括号+下标：在目标位置上添加，空缺处用NULL补齐
list7[[1]] <- FALSE  # 若目标位置上已有组件，则覆盖其值
# 2.加组件及其标签
list8 <- list3
list8$new <- TRUE  # 用列表名$标签，直接将组件加到末尾，不用担心下标位置不对

# 列表的删除
# 1.NULL赋值：索引到组件中内容，赋值NULL即可（测试发现单中括号效果相同）
list9 <- list3
list9[[1]] <- NULL
list9$组件3 <- NULL
# 2.负索引：与之前向量的负索引用法相同
list10 <- list3
print(list10[-1])  # 删的是整个组件，因此只能用单中括号

# 列表拆分：unlist()
print(unlist(list3))  # 将列表中所有组件的值以列表形式列出，不会增删数据项

save.image("./list.Rdata")