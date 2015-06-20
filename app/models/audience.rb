class Audience

  def initialize(audience_name=:initial)
    @audience = audience_name
  end

  def is_initial?
    @audience.equal? :initial
  end

  def is_practicing?
  end

  def is_advanced?
  end


end