require_relative '../lib/dg_countries_list'

describe DgCountriesList::DgCountriesList do
  context ".parse_file" do
    let(:countries_yml_content) {
      %{
      - - ad
        - name_zh: "安道尔"
          name_en: Andorra
          iso_2: AD
      - - ae
        - name_zh: "阿联酋"
          name_en: United Arab Emirates
          iso_2: AE
      }
    }
    before do
      expect(File).to receive(:open).and_return(countries_yml_content)
    end

    subject { DgCountriesList::DgCountriesList.send(:parse_file,
      'filepath', DgCountriesList::DgCountry) }

    it "returns hash as result" do
      expect(subject).to be_kind_of Hash
    end

    it "keys contains countires iso2 codes" do
      expect(subject.keys).to match %w(ad ae)
    end

    it "values must be DgCountry objects" do
      expect(subject.values).to all(be_kind_of DgCountriesList::DgCountry)
    end
  end

  context ".fill_information!" do
    let(:parsed_file) { double(:parsed_file) }

    it 'filling with countries DgCountry class' do
      expect(DgCountriesList::DgCountriesList).to receive(:parse_file).and_return(parsed_file).twice
      expect(DgCountriesList::DgCountry).to receive(:initialize_countries).with(parsed_file)
      expect(DgCountriesList::DgRegion).to receive(:initialize_regions).with(parsed_file)
      DgCountriesList::DgCountriesList.fill_information!
    end
  end
end
