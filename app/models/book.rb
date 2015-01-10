class Book < ActiveRecord::Base
	mount_uploader :file, AvatarUploader
end
