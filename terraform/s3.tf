# Bucket to host front end site
resource "aws_s3_bucket" "frontend" {
  bucket = "${var.WEBSITE_BUCKET_NAME}"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  tags = "${var.GLOBAL_TAGS}"
}

# Bucket to store builds
resource "aws_s3_bucket" "codepipeline_build_repository" {
  bucket = "${var.BUILDS_BUCKET_NAME}"
  acl    = "private"

  tags = "${var.GLOBAL_TAGS}"
}