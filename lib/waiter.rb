require 'pry'
class Waiter
    attr_accessor :name, :age
  
    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.find_all {|x| x.waiter == self}
    end

    def best_tipper
        tips = []
        meals.each {|x| tips << x.tip}
        meals[tips.index(tips.max)].customer
    end
end