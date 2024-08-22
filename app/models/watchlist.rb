class Watchlist < ApplicationRecord
  belongs_to :user
  belongs_to :movie, optional: true
  belongs_to :tv_show, optional: true
end
