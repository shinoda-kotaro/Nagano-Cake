module Publics::CartItemHelper
  def array_maker(amount)
    return amount_array = (1..(amount+10)).to_a
  end

  def helper_amount(a ,b)
    return a += b
  end
end
