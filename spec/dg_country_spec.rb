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
end
