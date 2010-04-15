require "subtle/dominikh/dynamic_icon"

module Dominikh
  class Graph < DynamicIcon
    attr_accessor :color_ranges
    attr_reader :value

    def initialize(*args)
      super
      @color_ranges = {}
      @last_rendered_value = nil
      @value               = 0
    end

    # @return [String]
    def to_str
      unless @last_rendered_value == value
        render
      end
      super
    end
    alias_method :to_s, :to_str

    # Returns the color of the graph. If no suiting color can be found
    # in @color_ranges, it will default to the color set by {DynamicIcon#color=}.
    #
    # @return [Subtlext::Color]
    def color
      color = @color_ranges.find {|key, value| key.include?(self.value) }
      if color
        Subtlext::Color.new(color[1])
      else
        @color
      end
    end

    # Draws the graph. This method gets called automatically whenever
    # the value of the graph changes. Extend this method in subclasses
    # to define custom drawing routines.
    #
    # @return [void]
    def render
      super
      @last_rendered_value = value
    end
  end
end

require "subtle/dominikh/graph/bar"
require "subtle/dominikh/graph/chart"
require "subtle/dominikh/graph/colored_graph"
