# nindevdo

## How to use this repo
This repository is a DRY implementation of terraform for the entire nindevdo organization.  It uses the terraspace framework for it's implementation and is designed to be as simpla as possible to use as well as have the automation in place to keep things as simple as possible while deploying complex infrastructure. It's open-source because that's what nindevdo is all about. And it's a good example of how to create an entire organization using terraform.

To use this repository you need to run
docker-compse up the secrets for AWS or GCP are or should be in github secrets manager

export keys for aws, gcp, etc
cd aws-nindevo
bundle install
terraspace init
terraspace plan


To modify state look in .terraspace-cache and drill down until you find the appropriate directory and then you can run terraform state import, mv, etc. commands.

The docker-compose.yml file assumes you either have the AWS environment variables available or in a global context. In GitHub for example the environment variables are set globally for codespaces.