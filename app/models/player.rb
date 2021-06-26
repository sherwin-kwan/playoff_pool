class Player < ApplicationRecord
  def name
    self.first_name.first + ". " + self.last_name
  end
end
