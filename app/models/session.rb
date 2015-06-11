class Session
  def initialize(session_name)
    @session = session_name
  end

  def is_workshop?

  end

  def is_presentation?
    @session.equal? :presentation
  end

  def is_empty?

  end

end