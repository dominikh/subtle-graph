require "subtle/dominikh/graph"

module Dominikh
  class Chart < Graph
    attr_reader :values

    # @param [Fixnum] width The width of the chart. This corresponds
    # with the number of values.
    # @param [Fixnum] height The height of the chart.
    # @param [Boolean] autoscale If false, values are expected to be
    # percentage values. If true, values will be dynamically scaled
    # based on the biggest one.
    def initialize(width, height, autoscale = false)
      super(width, height)
      @values = [0]
      @autoscale = autoscale
      if autoscale
        @biggest_value = 0
      end
    end

    # @return [Number] The most current value
    def value
      @values.first
    end

    # Allows setting an array of values. If too many values are
    # provied, the array will be truncated
    #
    # @param [Array<Numeric>] arr An array of numbers
    # @return [Array] The array of values, possibly truncated
    def values=(arr)
      @values = arr[0..@icon.width]
      max = @values.max
      @biggest_value = max if max > @biggest_value
      render
      @values
    end

    # Adds a new value, potentially removing the oldest one if the max
    # number of values is exceeded
    #
    # @param [Numeric] value A value to store
    # @return The value
    def push(value)
      @biggest_value = value if @autoscale && value > @biggest_value
      @values.unshift(value)

      # only store as many values as we can display
      if @values.size > width
        @values.pop
      end

      render
      value
    end

    def render
      super
      if @autoscale
        factor = height.to_f / @biggest_value
      end

      @values.each_with_index do |value, index|
        x = width - index
        if !@autoscale
          y = ((height / 100.0) * value).round
        else
          y = (factor*value).round
        end

        # draw the bar
        height.downto(height - y) do |one_y|
          draw(x, one_y)
        end
      end
    end
  end
end
