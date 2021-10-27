# Preview all emails at http://localhost:3000/rails/mailers/result_mailer
class ResultMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/result_mailer/result_published
  def result_published
    ResultMailer.result_published
  end

end
