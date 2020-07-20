require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("Snapchat","Evan","Social Media")
startup2 = Startup.new("Facebook", "Zuck","Social Media")
startup3 = Startup.new("Google","Zuck", "Search")
startup4 = Startup.new("Amazon","Bezos", "Ecommerce")

vc1 = VentureCapitalist.new("TCV",1200000000)
vc2 = VentureCapitalist.new("Sequoia",2000000000)
vc3 = VentureCapitalist.new("Battery",500000000)
vc4 = VentureCapitalist.new("Cowboy",200000000)

fr1 = FundingRound.new(startup1,vc1,"Seed",100)
fr2 = FundingRound.new(startup1,vc2,"Growth",500)
fr3 = FundingRound.new(startup1,vc1,"Seed",400)
fr4 = FundingRound.new(startup2,vc3,"Series A",250)
fr5 = FundingRound.new(startup3,vc2,"Seed",100)
fr6 = FundingRound.new(startup4,vc4,"Series A",200)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line