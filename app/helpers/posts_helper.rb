module PostsHelper
  def is_user? (user)
    @current_user == user
  end
end