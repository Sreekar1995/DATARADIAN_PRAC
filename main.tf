terraform {
  backend "s3" {
    region = "ap-south-1" #aws key, accesskey, secretkey & region
  }
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
    }
  }
}


provider "snowflake" {
  account = var.sf_account   #SF Acc username password calling it as var and it is in variable.tf
  user = var.sf_user  
  password = var.sf_password
}

# Example: Creating a Snowflake warehouse copied in documentation
resource "snowflake_warehouse" "example" {
  name            = var.warehouse #parameterised in script for dev/prod for wh & db declared in variables.tf
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

#values like wh and db names as per requirements dev & prod are given in dev.tfvars/ prod.tfvars