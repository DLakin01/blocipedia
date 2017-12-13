class Amount < ApplicationRecord
  attr_accessor :default

  def initialize (default)
    @default = default
  end

  def default
    default ||= 10_00
  end
end
