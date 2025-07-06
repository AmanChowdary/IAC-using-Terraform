output "iam_user_name" {
  description = "IAM user name created"
  value       = aws_iam_user.this.name
}

output "instance_profile_name" {
  description = "IAM instance profile name for EC2"
  value       = aws_iam_instance_profile.ec2_profile.name
} 