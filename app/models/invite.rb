class Invite < ActiveRecord::Base
  belongs_to :calendar
  belongs_to :user
end