provider "aws" {
  region = var.region1
}

provider "aws" {
  alias  = "east"
  region = var.region2
}

resource "aws_cloudformation_stack" "sns_topic" {
  name          = var.stack_name
  template_body = file("template/cf.yml")
  parameters = {
    TopicName = "${var.topic_name}"
    AccountId = "${data.aws_caller_identity.default.account_id}"
  }
  tags = (merge(
    tomap({ "Name" = "${var.stack_name}" })
  ))
}

resource "aws_cloudformation_stack" "sns_topic_east" {
  name          = var.stack_name
  template_body = file("template/cf.yml")
  parameters = {
    TopicName = "${var.topic_name}"
    AccountId = "${data.aws_caller_identity.default.account_id}"
  }
  tags = (merge(
    tomap({ "Name" = "${var.stack_name}" })
  ))
  provider = aws.east
}