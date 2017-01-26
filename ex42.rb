#Animal is-a object look at the extra credit
class Animal
end

#Dog is-a Animal (inherits from the class Animal)
class Dog < Animal
    
def initialize(name)
    #name is-a object and is-a Dog, and is-a Animal
    @name = name
    end
end

#Cat is-a Animal
class Cat < Animal

def initialize(name)
#name is-a object and is-a Cat and is-a Animal
    @name = name
    end
end

#Person is-a object
class Person
    def initialize(name)
    #name is-a Person
    @name = name
    #person has a pet of some kind
    @pet = nil
end

attr_accessor :pet
end

#Employee is-a Person
class Employee < Person
    def initialize(name, salary)
    #Name is-a Employee and is-a person.
    super(name)
    @salary = salary
end
end

#Fish is-a object
class Fish
end

#Salmon is-a Fish
class Salmon < Fish
end

#Halibut is-a Fish
class Halibut < Fish
end

#Rover is a dog
rover = Dog.new("Rover")

#Satan is a cat
satan = Cat.new("Satan")

#Mary is a person
mary = Person.new("Mary")

#mary has-a pet, which is satan
mary.pet = satan

#Frank is an employee
frank = Employee.new("Frank", 12000)

#Frank has a pet, which is rover
frank.pet = rover

#Flipper is a fish
flipper = Fish.new()

#crouse is a salmon
crouse = Salmon.new()

#harry is a halibut
harry = Halibut.new()

