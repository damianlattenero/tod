case Padrino.env
  when :development then begin
    TodMailer.config_mailgun(
        key = 'key-b2393fc2d4e86509d7a78d1e2649772e',
        sender = 'sandboxb17fa6d466794a3aa45d015b771a37f2'
    )
  end
  when :production  then begin
    TodMailer.config_mailgun(
      key    = ENV['MAILGUN_KEY'],
      sender = ENV['MAILGUN_SENDER']
    )
  end
  else
    # nothing
end
