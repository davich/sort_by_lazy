class Sortby
  def self.sort_by(array, *lambdas)
    new(*lambdas).sort(array)
  end

  def initialize(*lambdas)
    @lambdas = lambdas
    @cache = {}
  end

  def sort(array)
    array.sort do |left, right|
      compare(left, right)
    end
  end

  def compare(left, right)
    @lambdas.each do |lambda|
      x = cached(lambda, left) <=> cached(lambda, right)
      return x unless x == 0
    end
    0
  end

  def cached(lambda, elem)
    @cache[[lambda, elem]] ||= lambda.(elem)
  end
end
