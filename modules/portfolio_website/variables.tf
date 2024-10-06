variable "bucket_name" {
    description = "which s3 bucket to host the static website."
    type = string
}

variable "domain" {
    description = "website domain."
    type = string
}

variable "default_document" {
    description = "the main page of the website."
    type = string
    default = "index.html"
}

variable "error_document" {
    description = "the page to display when users navigate to a route that does not exist."
    type = string
    default = "404.html"
}