# Create state backend

```bash
# Change directory to this folder
$ cd s3-backend

# Initialize Terraform in this folder
$ terraform init

# Apply S3 and DynamoDB
$ terraform apply
```

## Notes

```hcl
resource "aws_s3_bucket" "terraform_state" {
  bucket        = "your-name-here"
  force_destroy = true
}
```

- Insert a unique S3 bucket name for your configuration
- After creating the state backend, connect to it within the parent directory to configure the honeypot
- Allows for secured state file within production
