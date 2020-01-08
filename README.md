# AWS_CICD_SETUP

Terrafrom code is used to setup the CICD pipeline on AWS with AWS services like CodeCommit, CodeBuild, CodeDeploy and CodePipeline.
This Terrafrom code will call the module `terraform-aws-codecommit-cicd` with several variables and setup the full AWS CodePipeline.


There are quite a few variables that can be passed into the module. Here is a brief explanation of what each one does:

`repo_name`: The name of our new Git repository.

`organization_name`: The organization name provisioning the template.

`repo_default_branch`: The default branch of our Git repository.

`aws_region`: The AWS region we want to provision our infrastructure in.

`char_delimiter`: The delimiter to use for unique names.

`environment`: What our development team calls this environment (i.e. dev v.s. prod).

`build_timeout`: How long CodeBuild will wait for a build to complete in minutes.

`build_compute_type`: The instance type CodeBuild will use to run our builds on.

`build_image`: The base AMI our build instances will use to run our builds on.

`test_buildspec`: The path to the test runner buildspec.yml file.

`package_buildspec`: The path to the package & deploy buildspec.yml file.

`force_artifact_destroy`: Specify whether or not we want to forcibly delete our build artifacts when this template is destroyed.
