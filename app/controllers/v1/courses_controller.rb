class V1::CoursesController < ApplicationController

  def index
    courses = Course.all
    render json: { data: ActiveModel::SerializableResource.new(courses, user_id: current_user.id,  each_serializer: CourseSerializer ).as_json, klass: 'Course' }, status: :ok
  end


  def show
    @course = Course.find(params[:id])
    render json: { data:  CourseSerializer.new(@course, user_id: current_user.id).as_json, klass: 'Course'}, status: :ok
  end


  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id
    if @course.save
      @course.share(params[:channel_id]) if !params[:channel_id].blank?
      render json: { data: CourseSerializer.new(@course).as_json, klass: 'Course' }, status: :ok
    end
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      render json: { data: CourseSerializer.new(@course, user_id: current_user.id).as_json, klass: 'Course' }, status: :ok
    else
      render json: { data: @course.errors.full_messages  }, status: :ok
    end
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.destroy
      render json: { data: 'OK'}, status: :ok
    end
  end

  def course_params
    params.require(:course).permit!
  end
end
