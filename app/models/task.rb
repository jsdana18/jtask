class Task < ApplicationRecord
    #輸入不可為空值
	# validates :name,  presence: true, length: { maximum: 150 }
    validates :name,  presence: true
    validates :content,  presence: true

    paginates_per 3

    enum state: [:wait, :go, :done]
    enum priority: [:low, :medium, :high]


    # def state_msg
    #     msg_list.select { |k| k[:state]==state}[0][:msg]
    #   end
    
    # def msg_list
    #     [ 
    #         { state: "wait", msg: '待處理' },        
    #         { state: "go", msg: '進行中' },
    #         { state: "done", msg: '完成' }
    #     ]
    # end

    # def state_msg
    #     msg_list.select { |k| k[:state]==priority}[0][:msg]
    #   end
    
    # def msg_list
    # [ 
    #     { state: "low", msg: '待處理' },        
    #     { state: "mid", msg: '進行中' },
    #     { state: "high", msg: '完成' }
    # ]
    # end

    # include AASM

    # aasm do
    #     state :wait, initial: true
    #     state :go, :done

    #     event :togo do
    #         transitions from: :wait, to: :go
    #     end

    #     event :todone do
    #         transitions from: [:wait, :go], to: :done 
    #     end
    # end

end
