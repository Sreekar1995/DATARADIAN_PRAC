terraform {
  backend "s3" {
    region = "ap-south-1"
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
  name            = var.warehouse
  warehouse_size  = "XSMALL"
  auto_suspend    = 60
  auto_resume     = true
}

# Example: Creating a Snowflake database
resource "snowflake_database" "example" {
  name = var.database_name
}

# Example: Creating a Snowflake schema
resource "snowflake_schema" "example" {
  database = snowflake_database.example.name
  name     = var.schema_name
} 

