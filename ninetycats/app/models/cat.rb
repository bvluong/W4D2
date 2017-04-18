# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
COLORS = %w(brown black white orange red blue green yellow purple)

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS, message: "Not a valid color" }
  validates :sex, inclusion: { in: %w(M F I), message: "Not a valid sex" }


  def age
    Time.now.year - birth_date.year
  end
end
