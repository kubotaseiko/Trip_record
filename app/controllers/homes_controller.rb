class HomesController < ApplicationController
  def top
    @tag_list = Tag.all
    # .includes(:tagmaps).where(tagmap: { id: 1 })
    # @tag_list = Tag.includes(:spots).where(spot: { user_id: current_user.id })
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
