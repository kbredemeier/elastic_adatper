module ElasticAdapter
  module Decoration
    class ResponseDecoratorFactory
      class << self
        def decorate(response)
          if response.key? :acknowledged
          elsif response.key? :created
          elsif response.key? :exception
          elsif response.key? :count
            return CountResponse.new(response)
          elsif response.key? :source
            return HitDecorator.new(response)
          elsif response.key? :hits
            return SearchResponse.new(response)
          elsif response.key? :valid
            return ValidationResponse.new(response)
          elsif suggestion?(response)
            return SuggestionResponse.new(response)
          end

          response
        end

        def suggestion?(response)
          second_key = response[response.keys[1]]
          return false unless second_key.is_a? Array
          return false if second_key.empty?
          return false unless second_key.first.is_a? Hash
          return false unless second_key.first.key? :options
          return true
        end
      end
    end
  end
end
