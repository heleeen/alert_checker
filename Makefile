# REMOTE_BUCKET_NAME := hoge

init:
	gem install mackerel-client -i function/vendor/bundle
	terraform fmt -recursive
	terraform init -backend-config="bucket=$(REMOTE_BUCKET_NAME)" -reconfigure

plan: init
	terraform plan -var-file=sample.tfvars

apply: plan
	terraform apply -var-file=sample.tfvars

# destroy: init
# 	terraform destroy -var-file=sample.tfvars
