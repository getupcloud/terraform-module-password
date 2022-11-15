locals {
  plain_text_id = (var.algorithm == "bcrypt") ? "${var.plain_text}:${var.bcrypt_options.cost}" : ""
}
