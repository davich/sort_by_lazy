class Sortby
  def initialize
    @first = {}
    @second = {}
  end

  def sort(array, first, second)
    array.sort do |left, right|
      x = cache_first(first, left) <=> cache_first(first, right)
      if x == 0
        cache_second(second, left) <=> cache_second(second, right)
      else
        x
      end
    end
  end

  def cache_first(proc, elem)
    @first[elem] ||= proc.(elem)
  end

  def cache_second(proc, elem)
    @second[elem] ||= proc.(elem)
  end
end

names = [['erlangga', 'last'], ['david', 'carlin'],['david', 'abc'],['david', 'rider'], ['angel', 'something']]
puts Sortby.new.sort(names, ->(x){puts x.first ; x.first}, ->(x){puts x.last ; x.last}).inspect
