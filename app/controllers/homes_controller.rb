class HomesController < ApplicationController
  def top
    @tag_list = Tag.all
    if user_signed_in?
      @favorites = Favorite.all.where(user_id: current_user.id).order(id: "DESC")
    end
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
