class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 #mount_uploader :avatar, AvatarUploader
  has_many :bookings
  has_many :desks, through: :spaces
  mount_uploader :avatar, AvatarUploader
  ratyrate_rater

  after_create :send_welcome_mail

  def send_welcome_mail
    ModelMailer.new_record_notification(@greeting).deliver
 end
end
