def balance(left_scale, right_scale, weights)
  weight_combinations(weights).each do |weight|
    if weight_difference(weight) == difference_in_current_scale_weights(left_scale, right_scale)
      return weight
    end
  end
  nil
end

def weight_combinations(weights)
  weight_combinations = weights.combination(1).to_a.concat weights.combination(2).to_a
end

def difference_in_current_scale_weights(left_scale, right_scale)
  (left_scale - right_scale).abs
end

def weight_difference(weight)
  weight.reduce(:-).abs
end
