class User < ApplicationRecord

    validates :name, presence: true, length: { maximum: Settings.max_length_name}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true, length: {maximum: Settings.max_length_email},
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }

    validates :password, presence: true, length: { minimum: Settings.min_length_pass}

    has_secure_password

    private

    def email_downcase
        email.downcase!
    end
end
