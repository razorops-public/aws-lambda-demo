locals {
  iam_user_name = "${var.name_prefix}-cicd"
}


data "aws_iam_policy_document" "deploy_policy" {
  statement {
    sid = "DeployFunctions"
    actions = [
      "lambda:GetFunctionConfiguration",
      "lambda:UpdateFunctionConfiguration",
      "lambda:UpdateFunctionCode",
      "lambda:PublishVersion",
    ]
    effect = "Allow"
    resources = [
      for name in var.lambdas:
      "arn:aws:lambda:${var.aws_region}:${data.aws_caller_identity.current.account_id}:function:${name}"
    ]
  }

  statement {
    sid       = "PermissionToPassARole"
    effect    = "Allow"
    actions   = ["iam:PassRole"]
    resources = [aws_iam_role.role.arn]
  }
}

resource "aws_iam_policy" "deploy_policy" {
  name        = "${var.name_prefix}-policy"
  description = "A lambda deployment policy from CI/CD"
  policy      = data.aws_iam_policy_document.deploy_policy.json
}

resource "aws_iam_user" "deploy" {
  name = local.iam_user_name
}

resource "aws_iam_user_policy_attachment" "deploy" {
  policy_arn = aws_iam_policy.deploy_policy.arn
  user       = aws_iam_user.deploy.name
}

resource "aws_iam_access_key" "creds" {
  user = aws_iam_user.deploy.name
}

