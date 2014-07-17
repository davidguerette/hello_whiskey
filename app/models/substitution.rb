class Substitution < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :substitute , class_name: 'Component'
end
