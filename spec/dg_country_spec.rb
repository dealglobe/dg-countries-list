require_relative '../lib/dg_country'

describe DgCountry do
  let(:ad_country) { double(:ad, name_zh: "安道尔", name_en: 'Andorra', iso_2: 'AD') }
  let(:ae_country) { double(:ae, name_zh: "阿联酋", name_en: 'United Arab Emirates', iso_2: 'AE') }

  before do
    DgCountry.initialize_countries('ad' => ad_country, 'ae' => ae_country)
  end

  context "#all" do
    it 'returns array of countries' do
      expect(DgCountry.all).to match [ad_country, ae_country]
    end
  end

  context "#by_iso" do
    it 'returns country by iso' do
      expect(DgCountry.by_iso('ad')).to eql ad_country
    end

    it 'works with symbols' do
      expect(DgCountry.by_iso(:ad)).to eql ad_country
    end

    it 'works with uppercased values' do
      expect(DgCountry.by_iso("AD")).to eql ad_country
    end

    it 'return nil if there is no such country' do
      expect(DgCountry.by_iso(:xz)).to be_nil
    end
  end

  context "#regions" do
    it 'return keys that was marked as true' do
      stub_const("DgCountry::REGIONS", %w(a b c))
      country = DgCountry.new(a: true, b: false, c: true)
      expect(country.regions).to match %w(a c)
    end

  end
end
