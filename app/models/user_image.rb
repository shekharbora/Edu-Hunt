class UserImage < ActiveRecord::Base
	attr_accessible :user_id,:name
	belongs_to :user
	mount_uploader :name, AvatarUploader
end
