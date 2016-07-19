class User < ActiveRecord::Base
  enum role: [:user, :editor, :admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end

  def is?(role)
    self.role == role.to_s
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
