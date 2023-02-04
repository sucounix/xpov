resource "aws_ecr_repository" "main" {
  # for_each             = toset(module.this.enabled ? local.image_names : [])
  # name                 = each.value

  name                 = "${var.name}-${var.environment}-${var.container_name_0}"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = false
  }
}


resource "aws_ecr_lifecycle_policy" "main" {
  # for_each   = toset(module.this.enabled && var.enable_lifecycle_policy ? local.image_names : [])
  # repository = aws_ecr_repository.name[each.value].name
  repository = aws_ecr_repository.main.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "keep last 10 images"
      action = {
        type = "expire"
      }
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
    }]
  })
}




resource "aws_ecr_repository" "container_name_1" {

  name                 = "${var.name}-${var.environment}-${var.container_name_1}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}


resource "aws_ecr_lifecycle_policy" "container_name_1" {

  repository = aws_ecr_repository.container_name_1.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "keep last 10 images"
      action = {
        type = "expire"
      }
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
    }]
  })
}




output "aws_ecr_repository_url" {
  value = aws_ecr_repository.main.repository_url
}

output "aws_ecr_repository_url_container_name_1" {
  value = aws_ecr_repository.container_name_1.repository_url
}
