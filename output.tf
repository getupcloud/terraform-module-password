output "secret" {
  value = shell_script.password.output["secret"]
}
