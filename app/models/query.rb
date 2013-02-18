class Query < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :description, :query

end
