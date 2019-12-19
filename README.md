# alert_checker

Check open alerts in Mackerel and notify them to Slack.

## Demo

![Notification Sample](https://github.com/heleeen/alert_checker/blob/master/docs/notification.png)

## How to Use

Deploy the function, Set up Chatbot and execute this on Slack.

```
@aws lambda invoke --payload {"service": "ServiceName"} --function-name alert_checker
```


## Requirements

- AWS
  - AWS Lambda
  - AWS Chatbot
- Mackerel
- Terraform > 0.12.8
- Ruby
