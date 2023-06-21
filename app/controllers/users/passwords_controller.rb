class Users::PasswordsController < Devise::PasswordsController
  # GET /users/password/new
  def new
    super
  end

  # POST /users/password
  def create
    super
  end

  # GET /users/password/edit?reset_password_token=abcdef
  def edit
    super
  end

  # PUT /users/password
  def update
    super
  end

  # ...
end
