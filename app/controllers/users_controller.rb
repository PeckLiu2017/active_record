require 'rest-client'
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def send_simple_message
      RestClient.post "https://api:key-20995113eba3a0f1cf5993e7ccce45c9"
          "@api.mailgun.net/v3/sandbox799ef89b0fd246e2a69a34beb28aecf9.mailgun.org/messages",
          :from => "Mailgun Sandbox <postmaster@sandbox799ef89b0fd246e2a69a34beb28aecf9.mailgun.org>",
          :to => "xiaoyang20170204@gmail.com <xiaoyang20170204@gmail.com>",
          :subject => "Hello xiaoyang20170204@gmail.com",
          :text => "Congratulations xiaoyang20170204@gmail.com, you just sent an email with Mailgun!  You are truly awesome!"
  end
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        ImportWorkerJob.perform_later(3003) # for test
        UserMailer.welcome_email(@user).deliver_now
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end
end
