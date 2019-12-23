provider "aws" {
  region  = "us-east-1"
}

module "codecommit-cicd" {
    source                 = "git::https://github.com/rakeshsinghtomar/terraform-aws-codecommit-cicd.git?ref=master"
    repo_name              = "Delete_me_pipeline"
    organization_name      = "Tomar"
    repo_default_branch    = "master"
    aws_region             = "us-east-1"
    char_delimiter         = "-"
    environment            = "dev"
    build_timeout          = "5"
    build_compute_type     = "BUILD_GENERAL1_SMALL"
    build_image            = "aws/codebuild/standard:2.0"
    build_buildspec        = "buildspec_build.yml"
    unittest_buildspec     = "buildspec_test.yml"
    sonar_buildspec        = "buildspec_sonar.yml"
    artifact_buildspec     = "buildspec_artifact.yml"
    target_buildspec       = "buildspec_tf.yml"
    force_artifact_destroy = "false"
}

output "repo_url" {
    depends_on = ["module.codecommit-cicd"]
    value = "${module.codecommit-cicd.clone_repo_https}"
}
