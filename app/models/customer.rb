class Customer < ApplicationRecord
    has_secure_password
    validates_presence_of :username
    validates_uniqueness_of :username
    validates_presence_of :email
    validates_uniqueness_of :email, case_sensitive: false

    validates_length_of :password, :minimum => 6

    before_create :generate_confirmation_instructions

    def generate_confirmation_instructions
        self.confirmation_sent_at = Time.now.utc
    end
end
