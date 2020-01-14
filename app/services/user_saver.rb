class UserSaver
  attr_reader :user

  PHONE_REGEXP = /\d{5,30}/
  EMAIL_REGEXP = /^.+@.+$/

  def initialize(user)
    @user = user
  end

  def save
    validate && user.save
  end

  private

  def validate
    validate_phone && validate_email && validate_name
  end

  def validate_phone
    user.phone.present? && user.phone =~ PHONE_REGEXP
  end

  def validate_email
    user.email.present? && user.email =~ EMAIL_REGEXP
  end

  def validate_name
    user.name.present?
  end
end
