class Users::SessionsController < Devise::SessionsController
  # GET /users/sign_in
  def new
    super
  end

  # POST /users/sign_in
  def create
    super
  end

  # DELETE /users/sign_out
  def destroy
    super
  end

  def after_sign_in_path_for(_resource)
    root_path
  end
  # ...
end
