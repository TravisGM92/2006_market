class Market

  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
    @total_inventory = {}
    @items = {quantity: 0,
    vendors: []}
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.select{ |vendor| vendor.inventory.include?(item)}
  end

  def all_items_sold
    @vendors.flat_map do |vendor|
      vendor.inventory.map do |item|
        item
      end
    end
  end

  def total_inventory
    all_items_sold.each do |item|
      @total_inventory[item] = {quantity: (vendors.map do |vendor|
        vendor.inventory.map do |item2|
          if item == item2
            item2[-1]
          end
        end
      end.flatten.compact.join.to_i), vendors: (@vendors.each do |vendor|
        vendor.inventory.select do |item3|
          @total_inventory[item] == item3
        end
      end

      )
    }
    end
    @total_inventory
  end
end
