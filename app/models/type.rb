class Type
  def initialize(session_name)
    @session = session_name
  end

  def is_workshop?
    @session.equal? :workshop
  end

  def is_presentation?
    @session.equal? :presentation
  end

  def is_empty?

  end

  def to_s
    @session.to_s
  end
  attr_reader :session

end