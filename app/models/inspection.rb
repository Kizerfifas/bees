class Inspection
  include Mongoid::Document
  include Mongoid::Timestamps

  field :inspected_on, type: Date
  field :total_frames, type: Integer
  field :brood_frames, type: Integer
  field :honey_frames, type: Integer
  field :other_info, type: String
  field :comment, type: String

  belongs_to :bee_family
end
