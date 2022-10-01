# == Schema Information
#
# Table name: bookmarks
#
#  id         :bigint           not null, primary key
#  comment    :text
#  movie_id   :bigint           not null
#  list_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
end
