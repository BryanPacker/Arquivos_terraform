# WAF (web application firewall) to protect infraestrutura web (CloudFront)
resource "aws_wafv2_web_acl" "pizzaria_waf" {
  name  = "pizzaria-waf"
  scope = "CLOUDFRONT"
  default_action {
    allow {}
  }
  # Rate Limiting (Anti-DDoS) - 100 requests por IP em 5min
  rule {
    name     = "RateLimitRule"
    priority = 1
    action {
      block {}
    }
    statement {
      rate_based_statement {
        limit              = var.limit_requests  # quantity of requests each 5 minutes per ip
        aggregate_key_type = "IP"
      }
    }
    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = true
      metric_name               = "RateLimitRule"
    }
  }
  # basic protection of the application (SQL Injection, XSS, etc.)
  rule {
    name     = "AWS-AWSManagedRulesCommonRuleSet"
    priority = 2
    override_action {
      none {}
    }
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = true
      metric_name               = "AWS-AWSManagedRulesCommonRuleSet"
    }
  }

  # protection against bad inputs (SQLi, XSS, LFI, RFI, etc.)
  rule {
    name     = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
    priority = 3
    override_action {
      none {}
    }
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = true
      metric_name               = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
    }
  }

  # be abble to monitor
  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "pizzaria-waf"
    sampled_requests_enabled   = true
  }
}