class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :wall, dependent: :destroy

  after_create :create_default_wall

  private

  def create_default_wall
    create_wall(title: "My Love Wall ❤️")
  end
end
