class Admin::UserDeviceTokensController < Admin::ApplicationController
  # GET /user_device_tokens
  # GET /user_device_tokens.json
  def index
    @user_device_tokens = UserDeviceToken.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_device_tokens }
    end
  end

  # GET /user_device_tokens/1
  # GET /user_device_tokens/1.json
  def show
    @user_device_token = UserDeviceToken.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_device_token }
    end
  end

  # GET /user_device_tokens/new
  # GET /user_device_tokens/new.json
  def new
    @user_device_token = UserDeviceToken.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_device_token }
    end
  end

  # GET /user_device_tokens/1/edit
  def edit
    @user_device_token = UserDeviceToken.find(params[:id])
  end

  # POST /user_device_tokens
  # POST /user_device_tokens.json
  def create
    @user_device_token = UserDeviceToken.new(params[:user_device_token])

    respond_to do |format|
      if @user_device_token.save
        format.html { redirect_to @user_device_token, notice: 'User device token was successfully created.' }
        format.json { render json: @user_device_token, status: :created, location: @user_device_token }
      else
        format.html { render action: "new" }
        format.json { render json: @user_device_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_device_tokens/1
  # PUT /user_device_tokens/1.json
  def update
    @user_device_token = UserDeviceToken.find(params[:id])

    respond_to do |format|
      if @user_device_token.update_attributes(params[:user_device_token])
        format.html { redirect_to @user_device_token, notice: 'User device token was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_device_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_device_tokens/1
  # DELETE /user_device_tokens/1.json
  def destroy
    @user_device_token = UserDeviceToken.find(params[:id])
    @user_device_token.destroy

    respond_to do |format|
      format.html { redirect_to user_device_tokens_url }
      format.json { head :no_content }
    end
  end
end
