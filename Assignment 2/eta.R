library(aaltobda)
library(ggplot2)
data("algae")
n = length(algae)
y = sum(algae)
E = 0.16
prior_alpha = seq(from = 1, to=100, length.out = 4 )
prior_beta = -(prior_alpha/E)*(E-1)
alpha = prior_alpha+y
beta = prior_beta+n-y


post_median = beta_point_est(alpha, beta, algae)
intervals = beta_interval(alpha, beta, algae, 0.9)


post_median = numeric(length(alpha))
for (i in 1:length(alpha)){
  post_median[i] = median(rbeta(n, alpha, beta))
}
plot(alpha+beta, post_median)
x= seq(from=0,to=1, by=1/270)
betapdf1 = dbeta(x,alpha[1],beta[1])
betapdf2 = dbeta(x,alpha[2],beta[2])
betapdf3 = dbeta(x,alpha[3],beta[3])
betapdf4 = dbeta(x,alpha[4],beta[4])
par(mfrow=c(1,1))
plot(x, betapdf1,
     type='l', col='red')
leg1 = paste0("alpha: ",prior_alpha[1], ", beta: ", prior_beta[1])

lines(x, betapdf2,
     type='l', col ='blue')
leg2 = paste0("alpha: ",prior_alpha[2], ", beta: ", prior_beta[2])

lines(x, betapdf3,
     type='l', col ='purple')
leg3 = paste0("alpha: ",prior_alpha[3], ", beta: ", prior_beta[3])

lines(x, betapdf4,
     type='l', col ='brown')
leg4 = paste0("alpha: ",prior_alpha[4], ", beta: ", prior_beta[4])

legend(0.4,15, legend=c(leg1, leg2, leg3, leg4),
       col=c("red", "blue", "purple", "brown"), lty=1, cex=0.8)  
