class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog(blog)
    @blog = blog

    mail to: "rimhkri@gmail.com",
      subject: '[Achieve]ブログが投稿されました'
  end

  def sendmail_contact(contact)
    @contacts = contact

    mail to: contact.email,
      subject: 'お問い合わせが完了しました'
  end
end
