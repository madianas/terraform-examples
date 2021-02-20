terraform {
  required_providers {
    ah = {
      source  = "advancedhosting/ah"
      version = "0.1.4"
    }
  }

}

provider "ah" {
  # Configuration options
  access_token = var.ah_token
}

