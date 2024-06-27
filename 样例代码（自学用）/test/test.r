# 设置工作目录，工作镜像会自动保存在此处
# 若没有.Rdata的镜像，则环境初始为空
setwd("C:/Users/CHEMISTRYMASTER/Desktop/RProjects/test")

# 用ls()查看已有的数据项，并用rm()清除
rm(list = ls())

# 赋值：若为箭头则指向要被赋值的变量，若为等号则为老用法
arr <- c(1, 3, 5, 7, 9)
num = 100
"helloworld" -> str

# 输出：用print()
print(arr)
print(num)
print(arr)

# 获取帮助有三种方法（以求和函数sum为例）
?sum
help(sum)
example(sum)

# 自定义函数，也是一种数据项
add <- function(a, b) {
  return(a + b)
}

# 用scan()读取文件
result <- scan(file = "./test.txt", what = "", nmax = -1, sep = "")

# 用readline()读取输入
input <- readline()
print(input)

# 保存：可选择数据项进行保存，或直接保存整个工作镜像
save(arr, file = "test1.Rdata")
save(num, str, file = "test2.Rdata")
save.image("all.Rdata")

# 直接退出Rstudio
# q()
