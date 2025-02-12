resource "aws_iam_user" "zjusermew" {
  name          = "zjusermew"
  force_destroy = true
}

resource "aws_iam_user_login_profile" "zjloginprofile" {
  user                  = aws_iam_user.zjusermew.name
  password_length       = 20
  password_reset_required = false
}

resource "aws_iam_user_policy_attachment" "zjuserpolicy" {
  user       = aws_iam_user.zjusermew.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_access_key" "zjuseraccesskey" {
  user = aws_iam_user.zjusermew.name
}

resource "local_file" "user_credentials" {
  content  = <<EOF
Access Key ID: ${aws_iam_access_key.zjuseraccesskey.id}
Secret Access Key: ${aws_iam_access_key.zjuseraccesskey.secret}
Password: ${aws_iam_user_login_profile.zjloginprofile.password}
EOF
  filename = "C:/Users/GNG/Downloads/zjuser_credentials.txt"
}
