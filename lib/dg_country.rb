require 'ostruct'

class DgCountry < OpenStruct
  class << self
    def initialize_countries(countries)
      @@countries_hash = countries
    end
  end
end
