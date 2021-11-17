data {
 int<lower=0> N;
 int<lower=0> J;
 vector[J] y[N];
}

parameters {
 vector[J] mu;
 vector <lower=0>[J] sigma;
}

model {
 for (j in 1:J){
  mu[j] ~ normal(0, 1);
  sigma[j] ~ inv_chi_square(10);
 }

 for (j in 1:J)
  y[,j] ~ normal(mu[j], sigma[j]);
 }

generated quantities {
 real ypred;
 ypred = normal_rng(mu[1], sigma[1]);
}
