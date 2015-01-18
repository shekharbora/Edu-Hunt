class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessible :email, :password, :remember_me, :avatar,:username,:firstname,:lastname,:user_image_attributes#, :avatar_cache, :remove_avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable#, :validatable
   # mount_uploader :avatar, AvatarUploader
   # has_one :user_image
   # accepts_nested_attributes_for :user_image
   has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_visibility => 'public'
    validates_attachment :avatar,:content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
    has_many :books,:dependent => :destroy
    has_many :authentications

    def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
      end
  end

end
