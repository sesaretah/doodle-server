class V1::UsersController < ApplicationController
  include JWTWrapper
  def login
    if User.find_by_email(params['email']).try(:valid_password?, params[:password])
      @user = User.find_by_email(params['email'])
      render :json => {data: {result: 'OK', token: JWTWrapper.encode({ user_id: @user.id }), user_id: @user.id}, klass: 'User'}.to_json , :callback => params['callback']
    else
      render :json => {result: 'ERROR',  error: I18n.t(:doesnt_match) }.to_json , status: :unprocessable_entity
    end
  end


  def sign_up
    @user = User.new(email: params['email'], password: params['password'], password_confirmation: params['password_confirmation'])
    if @user.save
      render :json => { data: {result: 'OK', token: JWTWrapper.encode({ user_id: @user.id }), user_id: @user.id}, klass: 'User'}.to_json, :callback => params['callback']
    else
      render :json => {result: 'ERROR', error: @user.errors }.to_json , status: :unprocessable_entity
    end
  end

  def index
    users = User.all
    render json: { data: ActiveModel::SerializableResource.new(users, user_id: current_user.id,  each_serializer: UserSerializer ).as_json, klass: 'User' }, status: :ok
  end

  def assignments
    user = User.find(params[:user_id])
    role = Role.find(params[:role_id])
    user.assign(role.id) if user && role
    render json: { data:  RoleSerializer.new(role, user_id: current_user.id).as_json, klass: 'Role'}, status: :ok
  end

  def delete_assignment
    user = User.find(params[:user_id])
    role = Role.find(params[:role_id])
    user.unassign(role.id) if user && role
    render json: { data:  RoleSerializer.new(role, user_id: current_user.id).as_json, klass: 'Role'}, status: :ok
  end

end
