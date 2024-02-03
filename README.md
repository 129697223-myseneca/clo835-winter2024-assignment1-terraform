# Deploy AWS Infrastructure

1. Clone this repository 
 
2. Generate ssh key pair

    ```bash
        ssh-keygen -t rsa -f clo835-assignment1-key
    ```
3. Apply Terraform code

    ```bash
        terraform init
        terraform apply -auto-approve
    ```

# Destroy resources

```bash
    terraform destroy -auto-approve
```
