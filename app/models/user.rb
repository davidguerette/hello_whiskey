class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :favorites

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def has_favorited?(recipe)
    if Favorite.where(user_id: self.id, recipe_id: recipe.id) == []
      false
    else
      true
    end
  end
end
