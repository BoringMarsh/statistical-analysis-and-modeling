setwd("C:/Users/CHEMISTRYMASTER/Desktop/RProjects/control")
rm(list = ls())

# 控制语句：花括号顶格，参考C#
# 一、for语句：
#   1.和一般for用法一致，不过只能用in遍历
#   2.next作用相当于continue，而break用法依旧
#   3.选择结构使用ifelse()，后面两个参数可传入花括号括起的代码段
forYes <- 0
forNo <- 0
for (item in c(3, 0, 3, 0)) {
  ifelse(item == 0,
  {
    forYes <- forYes + 1
    print("ok")
  },
  {
    forNo <- forNo + 1
    print("no")
  })
}

# 二、while语句：和一般while用法一致
whileNum <- 3
while (whileNum > 0)
{
  whileNum <- whileNum - 1
  print("while loop")
}

# 三、repeat语句：需要有break，否则进入死循环
repeatNum <- 3
repeat
{
  repeatNum <- repeatNum - 1
  print("repeat")
  if (repeatNum < 0)
  {
    break
  }
}

# 四、if-else语句：与一般if-else用法一致
for (score in c(34, 89, 56, 67, 78, 93, 59))
{
  if (score < 60)
    print("不及格")
  else if (score >= 60 && score < 70) {
    print("及格")
  }
  else if (score >= 70 && score < 80) {
    print("中")
  }
  else if (score >= 80 && score < 90) {
    print("良")
  }
  else
    print("优")
}

save.image("./control.Rdata")