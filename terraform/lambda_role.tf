locals {
  role_name     = "${var.name_prefix}-role"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "role" {
  count = var.create_role ? 1 : 0
  
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  name               = local.role_name
}

resource "aws_iam_role_policy_attachment" "basic" {
  count = var.create_role ? 1 : 0
  
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.role[0].name
}
