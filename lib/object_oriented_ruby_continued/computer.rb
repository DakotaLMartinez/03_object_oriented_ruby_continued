class Computer
  attr_accessor :brand, :screen_size, :model_name, :model_year
  attr_reader :last_backed_up_at, :asleep

  @@all = []

  def self.all 
    @@all
  end

  def self.create(attributes)
    computer = self.new(attributes)
    computer.save
    computer
  end

  def self.backed_up
    self.all.filter{|computer| computer.last_backed_up_at }
  end

  def initialize(attributes)
    @brand = attributes[:brand]
    @screen_size = attributes[:screen_size]
    @model_name = attributes[:model_name]
    @model_year = attributes[:model_year]
  end

  def sleep
    @asleep = true
  end

  def wake_up
    @asleep = false
  end

  def back_up
    @last_backed_up_at = DateTime.now
  end

  def about_this_computer
    {
      brand: @brand,
      screen_size: @screen_size,
      model_name: @model_name,
      model_year: @model_year,
      last_backup_time: @last_backed_up_at.strftime("%m-%e-%y %H:%M")
    }
  end

  def save #
    @@all << self
  end
end

# create and return the first computer within this method
def first_computer
  Computer.new(
    brand: "Apple",
    screen_size: 15.0,
    model_name: "Macbook Pro",
    model_year: 2012
  )
end

# create and return the second computer within this method
def second_computer
  computer = Computer.new(
    brand: "Apple",
    screen_size: 13.0,
    model_name: "Macbook Air",
    model_year: 2015
  )
end