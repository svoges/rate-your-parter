class LecturesController < ApplicationController
  def index
    @lectures = Lecture.all
  end

  def show
    @lecture = Lecture.find(params[:id])
  end

  def create
    @lecture = Lecture.new(lecture_params)
    @lecture.display_name = @lecture.name + " " + @lecture.semester + " " + @lecture.year.to_s
    @lecture.save
    redirect_to lectures_path
  end

  def new
    render 'new'
  end


  private

  def lecture_params
    params.require(:lecture).permit(:name, :semester, :year)
  end

end
