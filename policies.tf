# #data resource with "aws_iam_policy_document" can be used to get policies available readily.

# data "aws_iam_policy_document" "ec2_readonly" {
#   statement {
#     actions = [
#     "ec2:Describe*"]
#     resources = [
#     "*"]
#   }
# }
# resource "aws_iam_policy" "ec2_readonly" {
#   name   = "ec2_readonly"
#   policy = "${data.aws_iam_policy_document.ec2_readonly.json}"
# }

resource "aws_iam_policy" "ec2_full" {
  name = "ec2_full"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
            "Action": "ec2:*",
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "elasticloadbalancing:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "cloudwatch:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "autoscaling:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "iam:CreateServiceLinkedRole",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "iam:AWSServiceName": [
                        "autoscaling.amazonaws.com",
                        "ec2scheduled.amazonaws.com",
                        "elasticloadbalancing.amazonaws.com",
                        "spot.amazonaws.com",
                        "spotfleet.amazonaws.com",
                        "transitgateway.amazonaws.com"
                    ]
                }
            }
        }
    ]

}
EOF
}

resource "aws_iam_policy" "s3_bucket_policy" {
  name = "s3_bucket_policy_for_IAM_user"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:AbortMultipartUpload",
        "s3:Get*",
        "s3:List*",
        "s3:Delete*",
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::khalids-bucket"
    }
  ]
}
EOF

}
resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
}