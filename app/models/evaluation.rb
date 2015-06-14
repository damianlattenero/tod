require 'data_mapper'
require_relative 'evaluation_opinion'

class Evaluation
  include DataMapper::Resource

  # property <name>, <type>
  property :id,          Serial
  property :evaluator,   String, required: true, :length => 3..50
  property :comment,     Text,   required: true, :length => 1..500
  belongs_to :proposal

end