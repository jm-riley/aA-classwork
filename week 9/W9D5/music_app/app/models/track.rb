# == Schema Information
#
# Table name: tracks
#
#  id           :bigint(8)        not null, primary key
#  album_id     :integer          not null
#  title        :string           not null
#  track_number :integer          not null
#  lyrics       :text
#  bonus        :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Track < ApplicationRecord
    validates :album_id, :title, :track_number, presence: true

    belongs_to :album
end
