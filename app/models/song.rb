class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true 
    validates :title, uniqueness: { scope: %i[release_year artist_name] }

    with_options if: :released do |s|
        s.validates :release_year, presence: true
        s.validates :release_year, numericality: { less_than_or_equal_to: DateTime.now.year }
    end

end
