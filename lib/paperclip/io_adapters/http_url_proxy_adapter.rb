module Paperclip
  class HttpUrlProxyAdapter < UriAdapter
    def self.register
      Paperclip.io_adapters.register self do |target|
        String === target && target =~ REGEXP
      end
    end

    REGEXP = /\Ahttps?:\/\//

    def initialize(target, options = {})
      escaped = URI::DEFAULT_PARSER.escape(target)
      super(URI(target == URI.unescape(target) ? escaped : target), options)
    end
  end
end
