# Create SNS Topic
resource "aws_sns_topic" "my_topic" {
  name = "my-sns-topic"
}

# Create SNS Email Subscription
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.my_topic.arn
  protocol  = "email"
  endpoint  = "takeprajwal4@gmail.com" 
}


output "sns_topic_arn" {
  value = aws_sns_topic.my_topic.arn
}
