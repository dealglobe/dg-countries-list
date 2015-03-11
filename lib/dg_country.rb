require 'ostruct'

class DgCountry < OpenStruct
  class << self
    def initialize_countries(countries)
      @@countries_hash = countries
    end

    def all
      @@countries_hash.values
    end

    def by_iso(iso2)
      iso2 = iso2.to_s.downcase
      @@countries_hash[iso2]
    end
  end
end
