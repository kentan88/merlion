# class MyModel
#   attr_accessor :name
#
#   def initialize
#     @name = 'Ken'
#   end
# end
#
#
# model = MyModel.new
# model.tap do |mm|
#   mm.name = 'Barbie'
# end
#
# p model

# def show
#   product = Product.find(1)
#
#   product.save do |product|
#     res.success? ? redirect_to 'wherever' : res.errors
#   end
#
# end
#
# def show
#   product = Product.find(1)
#   product.save ? redirect_to 'wherever' : product.errors
# end


class TestApp
  given(user, info) do |data|
    propose(data)
  end
end
