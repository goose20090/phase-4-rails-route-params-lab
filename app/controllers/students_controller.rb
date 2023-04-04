class StudentsController < ApplicationController

  def index
    students = Student.all
    if student_params[:name]
      students = Student.where("first_name LIKE ? OR last_name LIKE ?", student_params[:name], student_params[:name])
    end
    render json: students
  end

  def show
    student = find_student
    render json: student
  end

  private 

  def find_student
    Student.find(params[:id])
  end
  
  def student_params
    params.permit(:id, :name)
  end

end
