# 4.1. Separate Configuration to Multiple Files

> What we should do now is separate our Terraform configuration to multiple files, as it is good practice that allows configuration modularity, reusability, etc.

>When done, we will have the following files (not necessary with the same file names):

 - main.tf – the main Terraform configuration file

 - variables.tf – contains variable declarations

 - values.tfvars – contains values for the variables

 - outputs.tf – contains outputs declarations

> ### Step 1: Define Input Variables

[variables](./variables.tf)

> ### Step 2: Create File with Variable Values

[app values](./taskboardAppValues.tfvars)


[app secrets](./taskboardAppSecrets.tfvars) - this will be gitignored in a real scenario

> ### Step 3: Define Outputs

[app outputs](./outputs.tf)

>### Powershell commands
``` powershell
1 az login
2 terraform fmt
3 terraform init
4 terraform validate
5 terraform plan
6 terraform apply -var-file taskBoardAppValues.tfvars -var-file taskBoardAppSecrets.tfvars
7 terraform destroy
```