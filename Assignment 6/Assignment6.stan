data {
  int<lower=0> N;
  vector[N] x;
  int<lower=0> n[N];
  int<lower=0> y[N];
  vector[2] mu; 
  matrix[2,2] sigma;
}

parameters {
  vector[2] theta; 
}

model {
  theta ~ multi_normal(mu, sigma);
  for (k in 1:N) {
    y[k] ~ binomial_logit(n[k],theta[1] + theta[2]*x[k]);
  }
  
}
