require 'ostruct'

module DgCountriesList
  class DgCountry < OpenStruct
    class NoSuchRegion < ArgumentError; end

    REGIONS = %i(asia australasia central_asia japan north_asia south_asia
      south_east_asia africa central_and_southern_africa northern west_africa
      americas central_america_and_the_caribbean north_america south_america
      europe central_and_eastern_europe eu northern_europe southern_europe
      western_europe middle_east gcc)

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

      def by_region(region)
        raise NoSuchRegion unless REGIONS.include? String(region).to_sym
        all.select { |country| country.public_send(region) }
      end
    end

    def regions
      REGIONS.select { |region| public_send(region) }
    end
  end
end