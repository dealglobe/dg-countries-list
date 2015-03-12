require 'ostruct'
require_relative 'concerns/translatable'

module DgCountriesList
  class DgRegion < OpenStruct

    include DgCountriesList::Translatable

    class << self
      def initialize_regions(regions)
        @@regions_hash = regions
      end

      def all
        @@regions_hash.values
      end

      def region_codes
        @@regions_hash.keys
      end

      def by_code(code)
        code = code.to_s.downcase
        @@regions_hash[code]
      end
    end

  end
end
