class Post < ActiveRecord::Base
	#dependent: :destroy  deletes nest controllers
	has_many 	:comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true
end
