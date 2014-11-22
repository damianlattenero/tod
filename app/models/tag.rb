require 'data_mapper'

class Tag
  include DataMapper::Resource

  # property <name>, <type>
  property :label,            String, key: true, unique_index: true, length: 3..50     
  property :proposals_list,   Object, required: true, default: []
  #has n,   :proposals

  def add_proposal(a_proposal)
    self.proposals_list.push(a_proposal)
  end

  def delete_proposal(a_proposal)
    self.proposals_list.delete(a_proposal)
  end

  def include?(a_proposal)
    self.proposals_list.include?(a_proposal)
  end

  def normalize_name
    name = ''
    self.label.downcase.split.each do |word|
      name =  name + '_' + (word.gsub /[\W\d]/, '') #quita todo menos letras
    end
    name[0] = ''
    self.label = '#' + name
  end
end