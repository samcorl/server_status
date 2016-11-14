namespace :slack do
  desc 'Send notification to Slack deploy channel'
  task :notify do
    flags = [:skip_dj, :skip_data, :skip_schema].map { |var|
              "#{var}=#{fetch(var)}" if fetch(var)
            }.compact
    flags_str = " (#{flags.join(", ")})" if flags.any?
    text = "#{fetch(:user)} is deploying to *#{fetch(:stage)}* "\
             "from _#{fetch(:branch)}_"\
             "#{flags_str}"
    sh %{curl -X POST \
              --data-urlencode \
              'payload={"channel": "#deploys",
              "username": "deploybot",
              "text": "#{text}",
              "icon_emoji": ":rocket:"}' \
              https://hooks.slack.com/services/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}
  end
end
