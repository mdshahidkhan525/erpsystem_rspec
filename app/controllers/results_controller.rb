class ResultsController < ApplicationController

  def publish
    a = Admin.last
    a.result_pub = true
    a.save
    

    #it is done for each student sent the result
    Student.all.each do |student|
        ResultMailer.result_published(student).deliver
    end  

    redirect_to home_result_path,notice:"Result Published.."
  end

  def check_marks
    @empty_mark = Result.all.where(:remark=> nil)
  end


  def assign

    #find all the data 
    subfind =Assignment.find_by("no=?", params[:a_num])
    #assignments

    asi = params[:stu_assignments]
    #subject

    asub = params[:subjects]

    #condition check for assignments subject and save

    if asub == "hindi"
      subfind.hindi= asi

    elsif asub == "english"
      subfind.english= asi

    elsif asub == "maths"
      subfind.maths= asi

    elsif asub == "science"
      subfind.science= asi

    elsif asub == "social_science"
      subfind.social_science= asi
    end
    
    subfind.save
    redirect_to faculty_dashboard_path ,notice:"Assignment Posted Successfully.."
  end

  def createresult

  end


	#marks management
  def marksinsert
    sturesult = Result.find_by("student_id=?", params[:s_id])
    sube = String(params[:subject])
    mark = Integer(params[:marks])

    if sube == "hindi"
      sturesult.hindi= mark

    elsif sube == "english"
      sturesult.english= mark

    elsif sube == "maths"
      sturesult.maths= mark

    elsif sube == "science"
      sturesult.science= mark

    elsif sube == "social_science"
      sturesult.social_science= mark
    end

    sturesult.total=500

    sturesult.save
    sturesult.obtained_marks = 0
    sturesult.save
    if (sturesult.hindi and sturesult.english and sturesult.maths and sturesult.science and sturesult.social_science) != nil
      sum = Integer(sturesult.hindi)+Integer(sturesult.english)+Integer(sturesult.maths)+Integer(sturesult.science)+Integer(sturesult.social_science)
      sturesult.obtained_marks = sum
      sturesult.save
      if ((sturesult.hindi >= 33) and (sturesult.english >= 33) and (sturesult.maths >= 33) and (sturesult.science >= 33) and (sturesult.social_science >= 33))
        sturesult.remark= "PASS"
        sturesult.save
      else
        a = 
        sturesult.remark= "FAIL"
        sturesult.save
      end
    end



    redirect_to student_list_path ,notice:"Marks Updated Successfully.."
  end

end
