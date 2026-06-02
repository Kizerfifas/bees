class BeeFamily
  include Mongoid::Document
  include Mongoid::Timestamps
  include Shrine::Attachment(:avatar)

  field :name, type: String
  field :description, type: String

  field :family_number, type: String
  field :queen_birth_year, type: Integer
  field :mother_family, type: String
  field :breed, type: String

  field :honey_productivity, type: Array, default: [] # массив хэшей: [{year: 2023, amount: 50}, ...]
  field :wax_productivity, type: Array, default: []   # массив хэшей: [{year: 2023, amount: 2.5}, ...]
  field :swarming_dates, type: Array, default: []     # массив дат: ["2023-05-10", ...]
  field :nucs_count, type: Array, default: []         # массив хэшей: [{year: 2023, count: 2}, ...]
  field :winter_comments, type: Array, default: []    # массив строк или хэшей: [{year: 2023, comment: "..."}, ...]

  field :avatar_data, type: String

  belongs_to :user
  has_many :inspections
end
