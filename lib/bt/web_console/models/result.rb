require 'bt/web_console/models/reference'

module BT
  module WebConsole
    class Result
      def initialize label
        @reference = Reference.new(label)
        @reference.valid? or raise BadReference
      end

      def as_json
        `bt-results --commit #{@reference} --format json`  end

      def as_human
        `bt-results --commit #{@reference} --format human`
      end
    end
  end
end
