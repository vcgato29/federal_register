class FederalRegister::SuggestedSearch < FederalRegister::Base
  add_attribute :description,
                :documents_in_last_year,
                :position,
                :search_conditions,
                :slug,
                :title

  def self.search(args={})
    response = get('/suggested_searches', query: args)

    responses = {}
    response.map do |section, searches|
      responses[section] = searches.map{|attributes| new(attributes)}
    end

    responses
  end
end
