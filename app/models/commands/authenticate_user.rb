module Commands
  class AuthenticateUser
    attr_accessor :email
    attr_reader :result

    include ActiveModel::Model
    include ActiveModel::Validations::Callbacks

    before_validation :downcase_email

    validates :email, presence: true

    def execute
      return unless valid?
      user = find_user
      @result = user
      return true if user.present?
      create_user
      @result = find_user
      true
    end

    private

    def find_user
      User.find_by(email: email)
    end

    def create_user
      user = User.new(email: email)
      user.save
    end

    def downcase_email
      self.email = email.try(:downcase)
    end
  end
end
