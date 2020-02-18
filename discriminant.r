library(ggplot2)
library(MASS)

dat_tra <- read.csv("sample_train.csv", header=T)
dat_test <- read.csv("sample_test.csv", header=T)

model <- lda(TF~+LEFT+RIGHT+TOP+BOTTOM+DIAGONA, data=dat_tra)

model

table(dat_tra$TF,predict(model)$class)

png("cross.png", width = 1000, height = 700, pointsize = 3, res=500)
plot(model)
dev.off()

test_result <- predict(model, dat_test)
test_result

png("point.png", height=800, width=1280)
ggplot() + geom_point(aes(x = dat_tra$LENGTH, y = dat_tra$DIAGONAL, colour = dat_tra$TF))
dev.off()

mean(dat_tra$DIAGONAL)
median(dat_tra$DIAGONAL)
var(dat_tra$DIAGONAL)
sd(dat_tra$DIAGONAL)
min(dat_tra$DIAGONAL)
max(dat_tra$DIAGONAL)
summary (dat_tra)
