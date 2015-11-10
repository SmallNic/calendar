class Calendar < ActiveRecord::Base

    has_many :users_calendars
    has_many :users, :through => :users_calendars
    has_many :events, :dependent => :destroy

end
