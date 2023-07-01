terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {

  token = "ghp_78B7vzJgsrx9fsGE7B6whZkuBBluE3Yb0Cv"
}
