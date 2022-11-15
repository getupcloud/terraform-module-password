locals {
  secret = bcrypt(var.plain_text, var.bcrypt_options.cost)
}

resource "shell_script" "password" {
  triggers = {
    plain_text_hash = sha256(local.plain_text_id)
  }

  sensitive_environment = {
    SECRET = local.secret
  }

  lifecycle {
    ignore_changes = [sensitive_environment]
  }

  lifecycle_commands {
    create = <<-EOF
      echo "{\"secret\":\"$SECRET\"}"
    EOF

    delete = "echo {}"
  }
}
