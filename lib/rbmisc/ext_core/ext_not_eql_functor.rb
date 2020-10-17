# frozen_string_literal: true

def functor_not_eql?
  ->(obj, other) { return !obj.eql?(other) }
end
