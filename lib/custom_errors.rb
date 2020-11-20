class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  def get_married(person)
    self.partner = person
    if person.class != Person
  # This begins the pattern of error rescuing
      begin
  # Raise method allows you to navigate
  # to a custom error message when certain
  # parameters are met or not met
      raise PartnerError
    rescue PartnerError => error
      puts error.message
    else
      person.partner = self
    end
  end

  class PartnerError < StandardError
    def message
    "you must give the get_married method an argument of an instance of the person class!"
    end
  end

end

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name
