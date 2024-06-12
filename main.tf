resource "aws_cloudwatch_metric_alarm" "instance_metrics_alarms" {
  for_each = var.instance_parameters

  alarm_name          = "instance-metrics-alarm-${each.key}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "MemoryUtilization"
  namespace           = "System/Linux"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This metric monitors metrics for instance ${each.key}"

  dimensions = {
    InstanceId   = each.value.instance_id
    ImageId      = each.value.ami_id
    InstanceType = each.value.instance_type
    Device       = each.value.device
    Fstype       = each.value.fstype
    Path         = each.value.path
  }
}
