require 'yaml'
require_relative 'dg_country'
require_relative 'dg_region'

module DgCountriesList
  class DgCountriesList
    def self.fill_countries!
      DgCountry.initialize_countries self.parse_file('lib/countries.yml', DgCountry)
      DgRegion.initialize_regions(self.parse_file('lib/regions.yml', DgRegion))
    end

    private

    def self.parse_file(file, klass)
      YAML.load(File.open(file)).map do |model|
        code, info = model
        Hash[code, klass.new(info)]
      end.inject({}, &:merge)
    end
  end
end
