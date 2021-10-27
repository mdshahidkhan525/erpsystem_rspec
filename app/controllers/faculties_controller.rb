class FacultiesController < ApplicationController
  before_action :set_faculty, only: %i[ show edit update destroy ]

  # GET /faculties or /faculties.json
  def index
    @faculties = Faculty.all
  end
  
  def list
    @sdetail = Student.all
  end
  
  def login

  end


  def signout
    $faculty = nil
    redirect_to faculty_login_path, notice:"Faculty logout successfully.."
  end

  def dashboard
  end
  
#checking data
  def is_login
    $faculty = Faculty.find_by("email=? AND password=?", params[:email], params[:password])

    if $faculty.present?
        redirect_to faculty_dashboard_path, notice: "Faculty Logged in successfully.."
    else
        redirect_to faculty_login_path, notice: "Invalid Email or password.."
    end
  end

  def students_details
    $studentdetails = Student.find_by("roll_no=?", params[:rollno])

    if $studentdetails.present?
        redirect_to student_details_path, notice: "Students Details founded.."
    else
        redirect_to search_student_path, notice: "Student Details Not founded.."
    end
  end
   
  # GET /faculties/1 or /faculties/1.json
  def show
  end

  # GET /faculties/new
  def new
    @faculty = Faculty.new
  end

  # GET /faculties/1/edit
  def edit
  end

  # POST /faculties or /faculties.json
  def create
    @faculty = Faculty.new(faculty_params)

    respond_to do |format|
      if @faculty.save
        format.html { redirect_to @faculty, notice: "Faculty was successfully created." }
        format.json { render :show, status: :created, location: @faculty }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faculties/1 or /faculties/1.json
  def update
    respond_to do |format|
      if @faculty.update(faculty_params)
        format.html { redirect_to @faculty, notice: "Faculty was successfully updated." }
        format.json { render :show, status: :ok, location: @faculty }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculties/1 or /faculties/1.json
  def destroy
    @faculty.destroy
    respond_to do |format|
      format.html { redirect_to faculties_url, notice: "Faculty was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faculty
      @faculty = Faculty.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def faculty_params
      params.require(:faculty).permit(:first_name, :last_name, :email, :mobile, :subject, :subject_code,:password,:faculty_id)
    end
end
