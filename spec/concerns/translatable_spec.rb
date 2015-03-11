require_relative '../../lib/concerns/translatable'

describe DgCountriesList::Translatable do
  class DgModelClass
    include DgCountriesList::Translatable
  end

  subject { DgModelClass.new }

  context "#locale" do
    let(:i18n_locale) { double(:i18n_locale, locale: :zh) }
    let(:globalize_locale) { double(:i18n_locale, locale: :au) }

    it "return default locale if there is no I18n or Globalize" do
      expect(subject.locale).to eql :en
    end

    it "use locale from I18n if it defined" do
      stub_const("I18n", i18n_locale)
      expect(subject.locale).to eql :zh
    end

    it "use locale from Globalize if it defined" do
      stub_const("I18n", i18n_locale)
      stub_const("Globalize", globalize_locale)
      expect(subject.locale).to eql :au
    end
  end

  context "#name" do
    it "retrives curresponding name by passing locale" do
      expect(subject).to receive(:locale).and_return :zh
      expect(subject).to receive(:name_zh)
      subject.name
    end

    it "retrives curresponding name with another locale" do
      expect(subject).to receive(:locale).and_return :en
      expect(subject).to receive(:name_en)
      subject.name
    end
  end

end
