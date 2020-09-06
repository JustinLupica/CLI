require 'uri'
require 'net/http'
require 'openssl'
require 'json'
class API
    def self.tags_list_api
    #---------TAGS LIST API-----------#
    url = URI("https://tasty.p.rapidapi.com/tags/list")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'tasty.p.rapidapi.com'
    request["x-rapidapi-key"] = 'bb5d74149emsha536f916b50bc31p12351djsn1bd69de8e6c7'

    response = http.request(request)
    #puts response.read_body
    @tags_list_data = JSON.parse(response.body)

    @tags_list_data['results'].each.with_index(1) do |tag, i|
        tag_obj = Tags.new(tag['display_name'], tag['name'])
    end
    end
    
# --------RECIPES LIST API--------#
def self.recipes_list_api
    url = URI("https://tasty.p.rapidapi.com/recipes/list?tags=#{$tag_input}&from=0&sizes=20")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'tasty.p.rapidapi.com'
    request["x-rapidapi-key"] = 'bb5d74149emsha536f916b50bc31p12351djsn1bd69de8e6c7'

    response = http.request(request)
    @recipes_list_data = JSON.parse(response.body)

    @recipes_list_data['results'].each.with_index(1) do |recipe, i|
        recipes = Recipes.new(recipe['name'], recipe['description'], recipe['original_video_url'], recipe['instructions'])
    end
end
end

