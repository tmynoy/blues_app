class Pace < ActiveHash::Base
  self.data = [
    { id: 0, name: '__'},
    { id: 1, name: '1'},
    { id: 2, name: '2'},
    { id: 3, name: '3'},
    { id: 4, name: '4'},
    { id: 5, name: '5'}
  ]

  include ActiveHash::Associations
  has_many :evaluations
end
