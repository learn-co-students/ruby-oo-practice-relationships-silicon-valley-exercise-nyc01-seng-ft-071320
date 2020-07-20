class Startup

    attr_accessor :name, :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(name, domain_str)
        self.name = name
        self.domain = domain_str
        self
    end

    def self.find_by_founder(founder_name)
        self.all.find{|startup| startup.founder == founder_name}
    end

    def self.domains
        self.all.map{|startup| startup.domain}.uniq
    end

    def sign_contract(vc_object, type, inv_amt)
        FundingRound.new(self, vc_object,type,inv_amt)
    end

    def num_funding_rounds
        FundingRound.all.count{|round| round.startup == self}
    end

    def total_funds
        FundingRound.all.map{|round| round.investment if round.startup == self}.compact.sum
    end

    def investors
        FundingRound.all.map{|round| round.venture_capitalist if round.startup == self}.compact.uniq
    end

    def big_investors
        FundingRound.all.map{|round| round.venture_capitalist if (VentureCapitalist.tres_comma_club.include?(round.venture_capitalist) && round.startup == self)}.compact.uniq
    end


end
