# outputs for arn
output "user_arn" {
  value = "${aws_iam_user.newusers.0.arn}"
}

output "password" {
  value = aws_iam_user_login_profile.newusers.*.encrypted_password
}