class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password
  after_destroy :ensure_one_user_exists

  private

  def ensure_one_user_exists
    if(User.count.zero?)
      raise 'Cant delete last user.'
    end
  end
end
