# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord

  validates(:director_id, {:presence => true})

  belongs_to(:director, {:foreign_key => "director_id", :class_name => "Director"})

  # def director
  #   my_director_id = self.director_id

  #   matching_directors = Director.where({ :id => my_director_id })
    
  #   the_director = matching_directors.at(0)

  #   return the_director
  # end

  def director_name_or_uh_oh
    if self.director != nil
      return self.director.name
    else
      return "Uh oh! We weren't able to find a director for this movie."
    end
  end

end
