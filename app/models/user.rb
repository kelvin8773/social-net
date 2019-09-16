# frozen_string_literal: true

class User < ApplicationRecord
  include Gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }

  gravtastic  :secure => true,
              :filetype => :gif,
              :size => 160

    

  def first_name
    name.split(' ').first
  end

  def last_name
    name.split(' ').last
  end
end
