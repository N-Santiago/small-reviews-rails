class User < ActiveRecord::Base
  validates :username, presence: true
  has_many :reviews
  has_many :categories, through: :reviews
  has_many :comments
  has_many :commented_posts, through: :comments  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter]

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end

  def wrote_this(obj)
    if obj.class == Review && obj.user_id == self.id 
      true
    elsif obj.class == Comment && obj.user_id == self.id 
      true
    else
      false
    end
  end

end
