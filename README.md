# Start 2 web servers and 1 database server with one line

The task is completed via terafform, user_data scripts and prepared DB and configurations that are stored  in S3 bucket.
The S3 bucket is independent.
The solution many disadvantages and security issues, but you can deploy 2 Wordpress instances and 1 Database with the content provided.
The terraform states are stored locally



## Requirements
 1. AWS credentials - ~/.aws/credentials is loaded by defaul
 2. Terraform version - v0.11.14 ( binary is provided in the repo folder scripts )
 3. You need to have a ssh key which will be loaded from ~/.ssh/id_rsa
    However there is no direct ssh enabled at the moment. The Web servers and DB are in priv networks behind the LB
     
## How to run it
   1. Checkout the repo
   2. Go to terraform directory
   3. Execute `terraform init`
   4. Execute `terraform plan` to see resources that are going to be created
   5. Execute `terraform apply -auto-approve`
      This will create 2 web servers and 1 DB and Load Balancer
      From the output you will see the ELB url.
      Open it in a web browser to check the text loaded in Wordpress
   6. To destroy the environment just execute `terraform destroy`
                                 
## Result
   You will have 2 Web servers , 1 DB server and 1 ELB
