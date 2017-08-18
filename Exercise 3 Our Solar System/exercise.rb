require 'pry'
# First we'll need a class to represent the solar system. Let's call it System, and give it an attribute bodies.
class System

  # bodies will start as an empty array (ie. []).
  @@bodies = []

  def initialize(name)
    @name = name
  end


  # Let's make bodies read-only
  def self.bodies
    @@bodies
  end

  def self.check_bodies(name)
    @@bodies.each do |body|
      if body.get_name == name
        return false
      end
    end
  end


  #and give System an instance method called add which will add a celestial body to the list.
  def self.add_body(body)
    @@bodies << body
  end

# We'll also need an instance method called total_mass which should add up the mass of all the bodies in bodies, and return it.
def total_mass

end

end



# We'll also need a class to represent the various celestial bodies. We'll call it Body.
class Body

  # Each of them will need a name and a mass. Let's make these read-only; we'll assign them when we create the body.
  def initialize(name, mass)
    @name = name
    @mass = mass
  end

  def get_name
    @name
  end

end


# Each of our body types needs a class: Planet, Star, and Moon. All of these bodies have some similarities: they all have a name and a mass. So, let's also make them inherit from Body. They do have some unique qualities though.

class Planet < Body

  NUMBER_OF_HOURS_IN_DAY = 24
  NUMBER_OF_DAYS_IN_YEAR = 365
  # Planets:
  # Have a day, which is the number of hours it takes for the planet to rotate all the way around once.
  # Have a year, which is the number of days it takes for the planet to orbit the sun once. Whether you want to express this in Earth days or the planet's days is up to you.
  @@day = NUMBER_OF_HOURS_IN_DAY
  @@year = NUMBER_OF_DAYS_IN_YEAR

  def self.create(name, mass, system_name)
      if System.check_bodies(name)
        new_planet = Planet.new(name, mass)
        System.add_body(new_planet)
        puts "Celestial Body '#{new_planet.get_name}' successfully added to System"
      else
        puts "Oops it appears as though planet '#{name}' already exists, please try again"
      end
  end


end


class Star < Body
  # Have a type (ie. our Sun is a G-type star)
    def initialize(name, mass, type)
      @name = name
      @mass = mass
      @type = type
    end

    def self.create(name, mass, type)
      new_star = Star.new(name, mass, type)
      System.add_body(new_star)
      puts "Celestial Body '#{new_star.get_name}' successfully added to System"
    end

end

class Moon < Body

  NUMBER_OF_DAYS_IN_MONTH = 30
  # Moons:
  # Have a month, which is the number of days it takes for the moon to orbit its planet. Again, this can either be Earth days or the planet's days, your choice.
  # Have a planet that they orbit. We want to store the whole Planet object here.
  @@month = NUMBER_OF_DAYS_IN_MONTH

  def initialize(name, mass, planet)
    @name = name
    @mass = mass
    @month = @@month
    @planet = planet
  end

  def self.create(name, mass, type)
    new_star = Star.new(name, mass, type)
    System.add_body(new_star)
    puts "Celestial Body '#{new_star.get_name}' successfully added to System"
  end

end

# Once we have our structure defined, let's start adding some things to our solar system. We can start with the Sun, the Earth, and the Earth's moon. Don't worry too much about getting the masses correct, any number really will do, although you can find their masses on Wikipedia if you want.
puts "======== + Adding System ========"
milky_way = System.new("Milky Way")
puts
puts "======== + Adding Planets ========"
venus = Planet.create("Venus", 0.82, milky_way)
earth = Planet.create("Earth", 1, milky_way)
mars = Planet.create("Mars", 0.11, milky_way)
jupiter = Planet.create("Jupiter", 317.8, milky_way)
saturn = Planet.create("Saturn", 95.2, milky_way)
uranus = Planet.create("Uranus", 14.6, milky_way)
neptune = Planet.create("Neptune", 17.2, milky_way)
puts
puts "======== + Adding Stars ========"
sun = Star.create("Sun", 40.0, "G-type")
puts
puts "======== + Adding Moons ========"
moon = Moon.create("Moon", 0.04, milky_way)
puts
puts System.bodies.inspect

###TEST###

# Don't allow the same celestial body to be added to the system more than once. There's only one Mars.
puts
puts "======Test to ensure celestial body with the same name cannot be added.======"
venus = Planet.create("Venus", 0.82, milky_way)
