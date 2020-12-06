class Dog
  attr_accessor :owner, :mood # set and get methods
  attr_reader :name # just get method, can't be changed

  @@all = []
  def initialize(name, owner) # initialized with name and owner
    @name = name  # name @variable assigned
    @owner = owner  # owner @variable assigned
    @mood = 'nervous' # mood set to nervous
    @@all << self # each instance pushed to class variable array
  end

  def self.all  # getter for @@all class variable
    @@all
  end
end