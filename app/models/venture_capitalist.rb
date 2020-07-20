class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_comma_club
        self.all.select{|vc| vc.total_worth > 1000000000}
    end

    def offer_contract(startup_obj, type, inv_amt)
        FundingRound.new(startup_obj,self,type,inv_amt)
    end

    def funding_rounds
        FundingRound.all.select{|round| round.venture_capitalist == self}
    end

    def portfolio
        FundingRound.all.map{|round| round.startup if round.venture_capitalist == self}.compact.uniq
    end

    def biggest_investment
        funding_rounds = FundingRound.all.select{|round| round.investment if round.venture_capitalist == self}
        funding_rounds.max_by{|round| round.investment}
    end

    def invested(domain_str)
        FundingRound.all.map{|round| round.investment if (round.startup.domain == domain_str && round.venture_capitalist ==self)}.compact.sum
    end

end
