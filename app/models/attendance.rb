class Attendance < ApplicationRecord
    belongs_to :event
    belongs_to :customer, class_name: 'User'

    def new_customer_mail
        UserMailer.attendances_email(self.event.admin).deliver_now
    end
      
end
