require "subtle/dominikh/graph"
module Dominikh
  class Bar < Graph
    attr_reader :value

    def initialize(width, height, orientation = :vertical)
      super(width, height)
      @orientation = orientation
      @value       = 0
    end

    # @return The value
    def value=(val)
      val = 100 if val > 100
      @value = val
      render
      @value
    end

    # @return [void]
    def render
      super

      if @orientation == :vertical
        top = ((height / 100.0) * value).round
        0.upto(width) do |x|
          height.downto(height - top) do |y|
            draw(x, y)
          end
        end
      elsif @orientation == :horizontal
        right = ((width / 100.0) * value).round
        0.upto(height) do |y|
          0.upto(right) do |x|
            draw(x, y)
          end
        end
      else
        # TODO raise
      end
    end
  end
end
