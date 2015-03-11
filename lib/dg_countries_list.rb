require 'yaml'
require_relative 'dg_country'

class DgCountriesList
  def self.fill_countries!
    DgCountry.initialize_countries(self.parse_file)
  end

  private

  def self.parse_file
    YAML.load(File.open('lib/countries.yml')).map do |country|
      iso, country_info = country
      Hash[iso, DgCountry.new(country_info)]
    end.inject({}, &:merge)
  end
end
