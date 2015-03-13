# [dg-countires-list]

[![Code Climate](https://codeclimate.com/github/dealglobe/dg-countries-list/badges/gpa.svg)](https://codeclimate.com/github/dealglobe/dg-countries-list)

All sorts of useful information about countries used in DG project + translation to chinese language.

## Usage

Firstly, you need to retreive all information from YAML files (`countries.yml` and `regions.yml`) by command
```ruby
DgCountriesList::DgCountriesList.fill_information!
```

###DgCountriesList::DgCountry
- Retrieve all countries
```ruby
DgCountriesList::DgCountry.all
=> [#<DgCountriesList::DgCountry name_zh="安道尔", continent="欧洲", ...
    #<DgCountriesList::DgCountry name_zh="阿联酋", continent="中东", ...
   ]
```
- Find country by 2-digit ISO version
```ruby
DgCountriesList::DgCountry.by_iso('au')
=> #<DgCountriesList::DgCountry name_zh="澳大利亚", continent="亚洲", ...
```
- Find countries by region
```ruby
DgCountriesList::DgCountry.by_region(:europe)
=> [#<DgCountriesList::DgCountry name_zh="安道尔", continent="欧洲", ...,
    #<DgCountriesList::DgCountry name_zh="阿尔巴尼亚", continent="欧洲", ...,
    #<DgCountriesList::DgCountry name_zh="奥地利", continent="欧洲", ...,
   ]
```
- Retrieve country regions
```ruby
country.regions
=> [#<DgCountriesList::DgRegion name_en="Africa", name_zh="非洲">,
  #<DgCountriesList::DgRegion name_en="Central and Southern Africa", name_zh="中非和南非">]
```

###DgCountriesList::DgRegion

- Retrieve all regions
```ruby
 DgCountriesList::DgRegion.all
=> [#<DgCountriesList::DgRegion name_en="Asia", name_zh="亚洲">,
  #<DgCountriesList::DgRegion name_en="Australasia", name_zh="澳大拉西亚">,
  ...
   ]
```

- Find region by code
```ruby
DgCountriesList::DgRegion.by_code(:europe)
=> #<DgCountriesList::DgRegion name_en="Europe", name_zh="欧洲">
```

All models Globalize and I18n friendly
```ruby
region = DgCountriesList::DgRegion.by_code(:europe)
# => #<DgCountriesList::DgRegion name_en="Europe", name_zh="欧洲">
I18n.locale = :en #=> :en
region.name # => "Europe"
I18n.locale = :zh # => :zh
region.name # => "欧洲"
```
same for Globalize locale, default locale -- en

