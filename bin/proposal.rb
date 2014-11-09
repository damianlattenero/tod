class Proposal
  attr_accessor :title
  attr_reader :description
  attr_reader :author

  def initialize(title, description, author)
    validate_fields_size(title)
    validate_fields_size(author)
    validate_fields_size(description, 1)
    @title = title
    @description = description
    @author = author
  end

  def validate_fields_size(a_field, min_size = 3)
    if a_field.length < min_size
      raise ("The value " + a_field + " should have more than " +
               min_size.to_s + " characters."
            )
    end
  end

  def same_title?(a_proposal)
    @title.eql? a_proposal.title
  end

  def append_author_to_title
    @title += (" - " + @author)
  end
end

