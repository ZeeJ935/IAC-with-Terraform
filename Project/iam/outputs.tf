output "access_key_id" {
  value = aws_iam_access_key.zjuseraccesskey.id
}

output "secret_access_key" {
  value = aws_iam_access_key.zjuseraccesskey.secret
  sensitive = true
}

output "generated_password" {
  value = aws_iam_user_login_profile.zjloginprofile.password
  sensitive = true
}
