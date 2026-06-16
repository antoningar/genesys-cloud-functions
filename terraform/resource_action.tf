resource "genesyscloud_integration_action" "function_action" {
  name                   = "Function"
  category               = "Function Data Actions"
  integration_id         = data.genesyscloud_integration.integration.id
  config_timeout_seconds = 20

  contract_input = jsonencode({
    "type" = "object",
    "required" = [
      "input"
    ],
    "properties" = {
      "input" = {
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

  config_request {
    request_type     = "POST"
    request_template = "$${input.rawRequest}" 
    headers = {}
  }

  config_response {
    translation_map = {
      result = "$.body"
    }
    translation_map_defaults = {
      result = "-1"
    }
    success_template = "{ \"result\": $${result}}"
  }

  function_config {
    description     = "Funtion"
    handler         = "dist/src/handler.handler"
    runtime         = "nodejs24.x"
    timeout_seconds = 15
    file_path       = "function.zip"
  }
}
