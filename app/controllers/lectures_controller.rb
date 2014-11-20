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
    if not @lecture.errors.full_messages.empty?
      flash[:error] = @lecture.errors.full_messages.to_sentence
      redirect_to new_lecture_path
    else
      redirect_to lectures_path
    end
  end

  def new
    render 'new'
  end


  private

  def lecture_params
    params.require(:lecture).permit(:name, :semester, :year)
  end

end
