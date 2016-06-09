module MailerHelper

  def set_mail_logo_attachment
    unless attachments.inline["logo.png"].present?
      attachments.inline["logo.png"] = File.read("#{Rails.root}/app/assets/images/logo.png")
    end
    @logo_url = attachments['logo.png'].url
  end

  def add_message_data_attachment(filename, data)
    attachments.inline[filename] = data
  end

end
