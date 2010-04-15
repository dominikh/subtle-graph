module Dominikh
  module ColoredGraph
    def color
      red = ((255/100.0) * value)
      green = 255 - ((255/100.0) * value)

      color = "#%.2x%.2x00" % [red, green]
      Subtlext::Color.new(color)
    end
  end
end
