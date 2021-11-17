data {
  int<lower=0> N; // number of data points
  vector[N] x;    // observation year
  vector[N] y;    // observation number of drowned
  real xpred;     // prediction year
}
parameters {
  real alpha;
  real beta;
  real<lower=0> sigma;
  real<lower=0> sigma_beta;
  real mu_alpha;
  real<lower=0> sigma_alpha;
}
transformed parameters {
  vector[N] mu = alpha + beta*x;
}
model {
  alpha ~ normal(mu_alpha,sigma_alpha);
  beta ~ normal(0, sigma_beta);
  y ~ normal(mu, sigma);
}
generated quantities {
  real ypred = normal_rng(alpha + beta*xpred, sigma);
}
