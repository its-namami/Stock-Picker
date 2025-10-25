require 'debug'

def stock_picker(stock_days)
  stock_days.each.with_index.with_object([0, 0]) do |(price, day), result|
    theo = stock_days.slice(day..-1)
    theo_buy = theo[0]
    theo_sell = theo.sort.last

    if theo_sell - theo_buy > result[1] - result[0]
      result[0] = theo_buy
      result[1] = theo_sell
    end
  end
end

def ask_stocks (stocks = [])
  print "Add a stock price (write __STOP__ to stop)\n:#{stocks.size + 1} >>> "
  stock = gets
  puts
  ask_stocks stocks << stock.to_i unless stock == "__STOP__\n"
  stocks
end

puts 'Welcome to Stock Picker!'
puts "The greatest profit you can get is #{stock_picker(ask_stocks).yield_self {|arr| arr[1] - arr[0]}}"
