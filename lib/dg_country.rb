require 'ostruct'
require_relative 'concerns/translatable'

module DgCountriesList
  class DgCountry < OpenStruct

    include DgCountriesList::Translatable

    class NoSuchRegion < StandardError; end

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
        raise NoSuchRegion unless DgRegion.region_codes.include? String(region).to_sym
        all.select { |country| country.public_send(region) }
      end
    end

    def regions
      DgRegion.region_codes.select { |region| public_send(region) }
    end
  end
end
