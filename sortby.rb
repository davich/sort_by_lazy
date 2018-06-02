class Sortby
  def self.sort_by(array, first, second)
    new(array, first, second).sort
  end

  def initialize(array, first, second)
    @array = array
    @first = first
    @second = second
    @first_cache = {}
    @second_cache = {}
  end

  def sort
    @array.sort do |left, right|
      x = cache_first(left) <=> cache_first(right)
      if x == 0
        cache_second(left) <=> cache_second(right)
      else
        x
      end
    end
  end

  def cache_first(elem)
    @first_cache[elem] ||= @first.(elem)
  end

  def cache_second(elem)
    @second_cache[elem] ||= @second.(elem)
  end
end

names = [['erlangga', 'last'], ['david', 'carlin'],['david', 'abc'],['david', 'rider'], ['angel', 'something']]
puts Sortby.sort_by(names, ->(x){puts x.first ; x.first}, ->(x){puts x.last ; x.last}).inspect
