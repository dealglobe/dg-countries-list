require 'yaml'
require_relative 'dg_country'
require_relative 'dg_region'

module DgCountriesList
  class DgCountriesList
    def self.fill_information!
      DgCountry.initialize_countries self.parse_file(File.expand_path('../countries.yml', __FILE__), DgCountry)
      DgRegion.initialize_regions(self.parse_file(File.expand_path('../regions.yml', __FILE__), DgRegion))
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
