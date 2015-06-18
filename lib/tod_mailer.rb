require 'rest-client'

class TodMailer
  include Singleton
  attr_accessor :key, :sender

  def self.config_mailgun(key = 'key-8d24af78cd198587a39e7e1c0cee25b5', sender = 'sandboxefb52827f90c4a2c88ad6776b1f97c2f')
    TodMailer.instance.key    = key
    TodMailer.instance.sender = sender
  end

  def self.send_mail(target, subject, text, from = 'Tod Administrator')
    mailer = TodMailer.instance
    if mailer.key && mailer.sender
      RestClient::Request.execute(
          :url => "https://api:#{mailer.key}@api.mailgun.net/v3/#{mailer.sender}.mailgun.org/messages",
          :method => :post,
          :payload => {
              :from =>  "#{from} <postmaster@#{mailer.sender}.mailgun.org>",
              :sender => 'Mailgun Sandbox <postmaster@sandbox30000.mailgun.org>',
              :to => target,
              :subject => subject,
              :text => text,
              :multipart => true
          },
          :headers => {
              :'h:X-My-Header' => 'www/mailgun-email-send'
          },
          :verify_ssl => false
      )
    end
  end
end