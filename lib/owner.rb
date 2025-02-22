class Owner
  attr_reader :species, :name 
  attr_accessor :cats, :dogs, :owner
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end  
  
  def say_species
    return "I am a #{self.species}."
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def self.reset_all
    @@all.clear
  end 

  def sell_pets 
    all_pets = self.cats + self.dogs 
    all_pets.each do |pet|
      sell_pet(pet)
    end
  end

  def list_pets
    num_dogs = self.dogs.count
    num_cats = self.cats.count
    return "I have #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end

  def sell_pet(pet)
    pet.owner = nil
    pet.mood = "nervous"
  end

   # code goes here

end