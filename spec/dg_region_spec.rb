require_relative '../lib/dg_region'

describe DgCountriesList::DgRegion do
  let(:asia_region) { double(:asia, name_zh: "亚洲", name_en: 'Asia') }
  let(:japan_region) { double(:japan, name_zh: "日本", name_en: 'Japan') }

  before do
    DgCountriesList::DgRegion.initialize_regions('asia' => asia_region, 'japan' => japan_region)
  end

  context ".all" do
    it 'returns array of regions' do
      expect(DgCountriesList::DgRegion.all).to match [asia_region, japan_region]
    end
  end

  context ".region_codes" do
    it 'returns array of region codes' do
      expect(DgCountriesList::DgRegion.region_codes).to match %w(asia japan)
    end
  end
end
