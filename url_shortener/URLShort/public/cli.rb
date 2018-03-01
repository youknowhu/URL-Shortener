puts "hello Email please"
inp = gets.chomp
user = User.find_by(:email => inp)
puts user.id
