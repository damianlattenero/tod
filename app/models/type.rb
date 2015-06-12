class Type

  def initialize(session_name=:presentation)
    @session = session_name
  end

  def is_workshop?
    @session.equal? :workshop
  end

  def is_presentation?
    @session.equal? :presentation
  end

  def to_s
    @session.to_s
  end

end