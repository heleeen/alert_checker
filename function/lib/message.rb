require_relative './mackerel'

if @alerts.length > 0
  @messages = {
    username: "Alert確認くん",
    icon_emoji: ":warning:",
    text: "#{$service_name}に In Progress なアラートがあります",
    attachments: [
      {
        color: "danger",
        fields: [
          {
            value: @alerts
          }
        ],
        footer: ":fish: Mackerel Alert Checker :fish:",
      }
    ],
  }
else
  @messages = {
    username: "Alert確認くん",
    icon_emoji: ":confetti_ball:",
    text: "#{$service_name}に In Progress なアラートはありません",
    attachments: [
      {

        color: "#4dbddb",
        fields: [
          {
            value: ":chopsticks::sushi::sushi::sushi::sushi::tea:"
          }
        ],
        footer: ":fish: Mackerel Alert Checker :fish:",
      }
    ],
  }
end
