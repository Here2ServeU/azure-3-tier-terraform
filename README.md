# Deploying A Tree-Tier Architecture on Azure

## Prerequisites
#### Create The Resource Group

az login

az group create --name t2s-backend-rg --location eastus

#### Create The Storage Account and Container

az storage account create --name t2sbackendstorage --resource-group t2s-backend-rg --location eastus --sku Standard_LRS

STORAGE_KEY=$(az storage account keys list --resource-group t2s-backend-rg --account-name t2sbackendstorage --query '[0].value' --output tsv)

storage container create --name tfstate --account-name t2sbackendstorage --account-key $STORAGE_KEY

**In case you have issues finding your key, use the following commands**
az storage account keys list --resource-group t2s-backend-rg --account-name t2sbackendstorage

STORAGE_KEY=$(az storage account keys list --resource-group t2s-backend-rg --account-name t2sbackendstorage --query '[0].value' --output tsv)


## Steps 

1. **Clone the repository**

git clone https://github.com/Here2ServeU/azure-3tier-infra-terraform.git
   
cd aws-autoscaling-sns-terraform

2. ***

terraform init

3. **Review and modify variables**

terraform init

4. **Plan the Deployment**

terraform plan

5. **Apply the Deployment**

terraform apply

6. **Clean up whenever necessary**

terraform destroy

## Security
- Ensure to replace the values with the desired ones for the terraform.tfvars file. 

- The best practice is to input these variables on your local machine rather than store them on GitHub. 

- You could use this command, terraform apply var-file="terraform.tfvars"

- Use the "export TF_VAR" command to input all the variables. E.g. export TF_VAR_region="us-east-1"


## Troubleshooting
If you encounter any issues, please check the following:

- Ensure your AWS CLI is configured correctly and you have the necessary permissions.
- Verify that your Terraform configurations are correct and all required variables are set.
- Check the AWS Management Console for any errors related to the resources being created.

## Contributing
Feel free to customize this `README.md` file according to your specific requirements and project details.
