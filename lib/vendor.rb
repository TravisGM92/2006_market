class Vendor

  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    @inventory.include?(item) ? @inventory[item] : @inventory[item] = 0
  end

  def stock(item, amount)
    @inventory[item] = amount
  end

  def potential_revenue
    @inventory.map do |k,v|
      ((k.price.gsub(/\D/,'').to_i.to_f/100)*v)
    end.sum
  end

end
