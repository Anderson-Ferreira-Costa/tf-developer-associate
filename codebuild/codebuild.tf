resource "aws_codebuild_project" "this" {
  name          = var.codebuilder_name
  build_timeout = "60"
  service_role  = aws_iam_role.this.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }
  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:6.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }
  source {
    type     = "CODECOMMIT"
    location = var.url_repository
  }

}
  