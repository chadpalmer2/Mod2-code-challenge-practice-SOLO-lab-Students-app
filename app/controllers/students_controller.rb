class StudentsController < ApplicationController

  before_action :student_current, only: [:show, :edit, :update]
  before_action :instructors, only: [:new, :edit]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.valid?
      @student.save
      redirect_to @student.instructor
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to new_student_path
    end
  end

  def edit
  end

  def update
    @student.assign_attributes(student_params)
    if @student.valid?
      @student.save
      redirect_to @student
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to edit_student_path(@student)
    end
  end

  private

  def student_current
    @student = Student.find(params[:id])
  end

  def instructors
    @instructors = Instructor.all
  end

  def student_params
    params.require(:student).permit(:name, :major, :age, :instructor_id)
  end

end
