resource "aws_ecr_repository" "repositories" {
  count = length(var.ecr_repositories)
  name  = var.ecr_repositories["${count.index}"]
  image_scanning_configuration {
    scan_on_push = true
  }
}
