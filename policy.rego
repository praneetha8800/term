package cicd

deny[msg] {
  input.user != "admin"
  input.environment == "prod"
  msg = "Only admin can deploy to production"
}
