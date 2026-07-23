# Create state backend

```bash
# Change directory to this folder
$ cd bootstrap

# Initialize Terraform in this folder
$ terraform init

# Apply S3 and DynamoDB
$ terraform apply
```

- After creating the state backend, connect to it within the src/ folder to configure the honeypot
- Allows for secured state file within production
