terraform {
  backend "s3" {
    bucket         = "victor-talent-academy-686520628199-tfstates"
    key            = "projects/ec2/ec2-FOTR.tfstates"
    dynamodb_table = "terraform-lock"
  }
}