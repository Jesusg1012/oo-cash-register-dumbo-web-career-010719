
class CashRegister
#----------------------------------------------------------
def initialize(discount = 0)
  @total = 0
  @items = []
  @item = {}
  @discount = discount
end
#----------------------------------------------------------
def add_item(object, cost, amount=1)
  @total += cost*amount
  x = amount
  while x > 0
    @items << object
    @item[object] = cost
    x-=1
  end
end
#----------------------------------------------------------
def discount
  @discount = 20
  return 20
end
#----------------------------------------------------------
def apply_discount
  if @discount == 0
    return "There is no discount to apply."
  end
  discounts = @total*(@discount*(0.01))
  @total -= discounts
  @total = @total.to_int
  "After the discount, the total comes to $#{@total}."
end
#----------------------------------------------------------
def void_last_transaction
  @total-= @item[@items.pop]
end
#----------------------------------------------------------
attr_accessor :total
attr_reader :items
end
