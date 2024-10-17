terraform {
  backend "remote" {
  # The name of your Terraform Cloud organization.
    organization = "sreekarorg_95"

      # The name of the Terraform Cloud workspace to store Terraform state files in.
      workspaces {
        name = "DATARADIAN_PRAC"
      }
    }
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
    }
  }
}

provider "snowflake" {
  account                = "ot78564.ap-southeast-1" //https://ot78564.ap-southeast-1.snowflakecomputing.com # required if not using profile. Can also be set via SNOWFLAKE_ACCOUNT env var
  user               = "snowflake945" # required if not using profile or token. Can also be set via SNOWFLAKE_USER env var
  password               = "Satyasree@9550"
}

# Example: Creating a Snowflake warehouse
resource "snowflake_warehouse" "example" {
  name            = "MY_WAREHOUSE"
  warehouse_size  = "XSMALL"
  auto_suspend    = 60
  auto_resume     = true
}

# Example: Creating a Snowflake database
resource "snowflake_database" "example" {
  name = "MY_DATABASE"
}

# Example: Creating a Snowflake schema
resource "snowflake_schema" "example" {
  database = snowflake_database.example.name
  name     = "MY_SCHEMA"
} 

