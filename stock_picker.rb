def stock_picker(prices)
  results = []

  buy_on = 0
  while buy_on < prices.length
    results.push(find_greatest_difference(buy_on, prices))
    buy_on += 1
  end

  best_deal = results.sort_by { |result| result[:difference] }[-1]

  return Array.new([best_deal[:buy], best_deal[:sell]])
end

def find_greatest_difference(buy_on, data)
  results = { difference: 0, buy: buy_on, sell: nil}

  data.each_index do |sell_on| 
    if results[:difference] < (data[sell_on] - data[buy_on]) && buy_on < sell_on
      results[:difference] = data[sell_on] - data[buy_on]
      results[:sell] = sell_on
    end
  end 

  return results;
end

prices = [17,3,6,9,15,8,6,1,10]
p stock_picker(prices)