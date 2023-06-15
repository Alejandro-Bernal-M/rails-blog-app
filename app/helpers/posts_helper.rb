module PostsHelper
  def user?(user)
    @current_user == user
  end
end
