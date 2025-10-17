output "event_bridge_arn" {
  value = aws_cloudwatch_event_rule.lambda_schedule.arn 
}
output "event_bridge_name" {
  value = aws_cloudwatch_event_rule.lambda_schedule.name
}
output "event_bridge_id" {
  value = aws_cloudwatch_event_rule.lambda_schedule.id
}


