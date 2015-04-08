require 'pry'
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
        raise NoSuchRegion unless DgRegion.region_codes.include? String(region)
        all.select { |country| country.public_send(region) }
      end
    end

    def regions
      region_keys.map { |region| DgRegion.by_code(region) }
    end

    def regions_keys
      DgRegion.region_codes.select { |code| public_send(code) }
    end
  end
end
