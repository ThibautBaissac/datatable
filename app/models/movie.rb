class Movie < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search, against: [:title, :rating, :quote, :release_date], using: {tsearch: {prefix: true}}
end
