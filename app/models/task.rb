class Task < ApplicationRecord
    #輸入不可為空值
	# validates :name,  presence: true, length: { maximum: 150 }
    validates :name,  presence: true
    validates :content,  presence: true
end
