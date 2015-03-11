module DgCountriesList
  module Translatable
    module InstanceMethods
      DEFAULT_LOCALE = :en

      def locale
        locale = DEFAULT_LOCALE
        locale = ::I18n.locale if defined? ::I18n
        locale = ::Globalize.locale if defined? ::Globalize
        locale
      end

      def name
        public_send("name_#{locale}")
      end
    end

    def self.included(receiver)
      receiver.send :include, InstanceMethods
    end
  end
end
