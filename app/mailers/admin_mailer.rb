#encoding: utf-8
class AdminMailer < ActionMailer::Base
  @correo = "admin@comerenlaua.es"

  default from: @correo
  default to: @correo

  def send_mail(subject, body)
    @body = body
    mail(subject: subject)
  end
end
