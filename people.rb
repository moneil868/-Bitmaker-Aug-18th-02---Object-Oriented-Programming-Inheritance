# Both the instructor and the student have names. We know that instructors and students are both people. Create a parent Person class that contains the attribute name and an initializer to set the name.

class Person
  # Both the instructor and the student have names. We know that instructors and students are both people. Create a parent Person class that contains the attribute name and an initializer to set the name.
  def initialize(name)
    @name = name
  end

  # Both the instructor and the student should also be able to do a greeting, like "Hi, my name is #{name}". Where's the best place to put this common method?
  def greeting
    puts "Hi, my name is #{@name}"
  end

  def name
    @name
  end

end


# Let's start by creating two classes: one called Student and another called Instructor.
class Student < Person
  # The student class has a method called learn that outputs "I get it!".
  def self.learn
      puts "I get it!"
  end
end



class Instructor < Person
  # The instructor class has a method called teach that outputs "Everything in Ruby is an Object".
  def self.teach
    puts "Everything in Ruby is an Object"
  end
end


# Create an instance of Instructor whose name is "Nadia" and call her greeting.
nadia = Instructor.new("Nadia")
puts nadia.greeting

# Create an instance of Student whose name is "Chris" and call his greeting.
chris = Student.new("Chris")
puts chris.greeting

# Call the teach method on your instructor instance and call the learn method on your student.
# nadia.teach
# chris.learn
#These two methods are class methods being called on instances, they should be instance methods.


# Next, call the teach method on your student instance. What happens? Why doesn't that work? Leave a comment in your program explaining why.
chris.teach

#This occurs because [1] this is a class method and [2] the Student class does not contain either an instance or class method called teach.
