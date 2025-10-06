resource "genesyscloud_integration_action" "function_action" {
  name                   = "AGAR Factorial"
  category               = "Function Data Actions"
  integration_id         = data.genesyscloud_integration.integration.id
  config_timeout_seconds = 20

  contract_input = jsonencode({
    "type" = "object",
    "required" = [
      "number"
    ],
    "properties" = {
      "inputData" = {
        "type" = "integer"
      }
    }
  })

  contract_output = jsonencode({
    "type" = "object",
    "required" = [
      "result"
    ],
    "properties" = {
      "result" = {
        "type" = "integer"
      }
    }
  })

  function_config {
    description       = "Funtion for factorial calculation"
    handler           = "handler.handler"
    runtime           = "nodejs22.x"
    timeout_seconds   = 30
    file_path         = "../functions/factorial.zip"
    file_content_hash = filesha256("../functions/factorial.zip")
    publish           = true
  }
}
