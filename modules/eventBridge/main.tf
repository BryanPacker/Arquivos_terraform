resource "aws_cloudwatch_event_rule" "lambda_schedule" {
  name                = var.rule_name
  description         = var.rule_description
  schedule_expression = var.schedule_expression
  depends_on = [ var.lambda_function_arn ]
}
resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.lambda_schedule.name
  target_id = var.lambda_id
  arn       = var.lambda_function_arn
}
resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = var.permission_statement_id
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.lambda_schedule.arn
}