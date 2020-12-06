class Owner
  attr_reader :name, :species # can't be changed

  @@all = []  # collects all owner instances
  def initialize(name)  # takes name as input
    @name = name  # instance variable for person name
    @species = "human"  # set species to human
    @@all << self # pushes each instance to @@all array
  end

  def say_species
    "I am a #{@species}." # tells species
  end

  def self.all  # getter method for @@all array
    @@all 
  end

  def self.count  #=> number of owners created
    @@all.count
  end

  def self.reset_all  #=> empty @@all array
    @@all.clear
  end

  def cats  #=> array of cats that belong to owner
    Cat.all.select {|cat| cat.owner == self} # calls cat class, finds matches for owner
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}  # calls dog class, finds matches for owner
  end

  def buy_cat(name) 
    new_cat = Cat.new(name, self) # creates cat instance w/ owner
    cats  # returns cats array for owner
  end

  def buy_dog(name)
    new_dog = Dog.new(name,self)
    dogs
  end

  def walk_dogs # collects all dogs for owner, sets mood to happy
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats # collects all cats for owner, sets mood to happy
    cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets # loops through owner's dogs and cats, sets mood = nervous, owner = nil
    dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets # puts how many dogs and cats owner has
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end