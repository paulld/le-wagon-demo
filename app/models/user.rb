class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :restaurants
  has_many :reviews

  after_create :send_welcome_email
  after_create :send_remind_email

  private

  def send_welcome_email
    FakeJob.perform_later(self.id)
  end

  def send_remind_email
    # in 1 day
    ReminderJob.set(wait: 30.seconds).perform_later(self.id)
  end
end
