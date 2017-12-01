class Member < ActiveRecord::Base

  # RatyRate gem
  ratyrate_rater

  # Associations
  has_many :ads
  has_one :profile_member
  accepts_nested_attributes_for :profile_member

  # Validations
  validate :nested_attributes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def nested_attributes
    if profile_member.first_name.blank?
      errors.add(:base, "É necessário preencher o campo Primeiro nome.")
    end
    if profile_member.second_name.blank?
      errors.add(:base, "É necessário preencher o campo Segundo nome.")
    end
  end

end
