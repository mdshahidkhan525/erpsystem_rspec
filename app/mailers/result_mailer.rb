class ResultMailer < ApplicationMailer

  def result_published(student)   
      @s = student.first_name
      @stu_email = student.email_id
      @stu_roll = student.roll_no
      mail(
        to: @stu_email,
        from: "Sunshine Public School",
        subject:"Result has been published"
          ) 
  end
end




#testcase
#cc:Student.all.pluck(:email_id),

# class ResultMailer < ApplicationMailer
#   def result_published
#     mail(to:"shkhan@bestpeers.com",from:"erpsystem09@gmail.com",subject:"testing_mail")
#   end
# end
