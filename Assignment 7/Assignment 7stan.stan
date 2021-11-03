data {
  int<lower=0> N; // number of data points
  vector[N] x;    // observation year
  vector[N] y;    // observation number of drowned
  real xpred;     // prediction year
}
parameters {
  real alpha;
  real beta;
  real<upper=0> sigma;
}
transformed parameters {
  vector[N] mu = alpha + beta*x;
}
model {
  y ~ normal(mu, sigma);
}
generated quantities {
  vector[N] ypred
  for(n in 1:N){
    real ypred[n] = normal_rng(mu[n], sigma);
  }
}
