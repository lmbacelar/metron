class UserPresenter < BasePresenter
  presents :user
  delegate :email, to: :user

  def details
    'no more info'
  end

  def name
    h.link_to user.name, user
  end

  def edit_link
    h.link_to 'Edit', h.edit_user_path(user), class: 'secondary'
  end

  def destroy_link
    h.link_to 'Destroy', user, method: :delete, data: { confirm: 'Are you sure?' }, class: 'alert'
  end
end
