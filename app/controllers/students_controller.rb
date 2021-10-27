class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  def signout
    $stu = nil
    redirect_to student_login_path, notice:"Student logout successfully.."
  end

  def login

  end

  def studentresult
    respond_to do |format|
      format.html
      format.pdf do 
        render pdf: "file_name",template: "students/result_details.html.erb"
      end
    end
  end

  def dashboard
  end
  
#student login
  def is_login
    $stu = Student.find_by("email_id=? AND password=?", params[:email], params[:password])
    if $stu.present?
        redirect_to  student_dashboard_path, notice:"Student Login successfully.."
    else
        redirect_to student_login_path, notice:"Invalid Email or Password.."
    end
  end

#add here result database

  def result_details
    a = Admin.last
    rp = a.result_pub
    if rp == true
      (
      $res  = Result.find_by("student_roll=?", params[:rollno])
      $sname =Student.find_by("roll_no=?", params[:rollno])

      if $res.present?
        respond_to do |format|
          format.html
          format.pdf do 
            render pdf: "file_name",template: "students/result_details.html.erb"
          end
        end
      else
          redirect_to student_result_path , notice:"Incorrect Roll Number"
      end
      )
    else
          redirect_to student_dashboard_path, notice:"Result not published yet.."
    end
  end



  # GET /students/1 or /students/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do 
        render pdf: "file_name",template: "students/show.html.erb"
        # render pdf: "file_name",template: "students/result_details.html.erb"
      end
    end
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :father_name, :roll_no, :email_id, :student_class, :password, :mobile, :student_id, :studentimage)
    end
end
