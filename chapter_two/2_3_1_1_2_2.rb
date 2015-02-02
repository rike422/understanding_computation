require './2_3_1_1_2.rb'

Multiply.new(
  Number.new(1),
  Multiply.new(
    Add.new(Number.new(2), Number.new(3)),
    Number.new(4)
  )
).to_s


expression =
  Add.new(
    Multiply.new(Number.new(1), Number.new(2)),
    Multiply.new(Number.new(3), Number.new(4)),
  )
