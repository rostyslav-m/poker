class Table < ActiveRecord::Base

  has_and_belongs_to_many :users

  def userscount
    users.count
  end

  def actual
    (userscount < 6)&&(time.to_s > Time.now.to_s)
  end

end
