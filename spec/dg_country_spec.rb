require_relative '../lib/dg_country'

describe DgCountriesList::DgCountry do
  let(:ad_country) { double(:ad, name_zh: "安道尔", name_en: 'Andorra',
    iso_2: 'AD', africa: false, europe: true) }
  let(:ae_country) { double(:ae, name_zh: "阿联酋", name_en: 'United Arab Emirates',
    iso_2: 'AE', africa: false, europe: false) }

  before do
    DgCountriesList::DgCountry.initialize_countries('ad' => ad_country, 'ae' => ae_country)
  end

  context ".all" do
    it 'returns array of countries' do
      expect(DgCountriesList::DgCountry.all).to match [ad_country, ae_country]
    end
  end

  context ".by_iso" do
    it 'returns country by iso' do
      expect(DgCountriesList::DgCountry.by_iso('ad')).to eql ad_country
    end

    it 'works with symbols' do
      expect(DgCountriesList::DgCountry.by_iso(:ad)).to eql ad_country
    end

    it 'works with uppercased values' do
      expect(DgCountriesList::DgCountry.by_iso("AD")).to eql ad_country
    end

    it 'return nil if there is no such country' do
      expect(DgCountriesList::DgCountry.by_iso(:xz)).to be_nil
    end
  end

  context '.by_region' do
    before(:each) do
      expect(DgCountriesList::DgRegion).to receive(:region_codes).and_return %i(africa europe)
    end

    it 'returns countries with such region' do
      expect(DgCountriesList::DgCountry.by_region(:europe)).to match [ad_country]
    end

    it 'returns empty array if there is no countries with such region' do
      expect(DgCountriesList::DgCountry.by_region(:africa)).to match []
    end

    it 'raise error for unknown region' do
      expect { DgCountriesList::DgCountry.by_region(:xz) }.to raise_error DgCountriesList::DgCountry::NoSuchRegion
    end
  end

  context "#regions" do
    it 'return keys that was marked as true' do
      expect(DgCountriesList::DgRegion).to receive(:region_codes).and_return %w(a b c)
      country = DgCountriesList::DgCountry.new(a: true, b: false, c: true)
      expect(country.regions).to match %w(a c)
    end

  end
end
