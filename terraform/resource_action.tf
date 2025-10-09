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
      "number" = {
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
    description     = "Funtion for factorial calculation"
    handler         = "dist/src/handler.handler"
    runtime         = "nodejs22.x"
    timeout_seconds = 15
    file_path       = "../function/factorial.zip"
  }
}
