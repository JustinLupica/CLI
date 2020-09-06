class Recipes
    attr_accessor :name, :description, :video_url, :instructions
    
    @@all_recipes = []

    def initialize(name, description, video_url, instructions)
        @name = name
        @description = description
        @video_url = video_url
        @instructions = instructions
        save
    end

    def self.all_recipes
        @@all_recipes
    end
    
    def save
        @@all_recipes << self
    end

    def self.display_all_recipes
        @@all_recipes.each.with_index(1) do |recipe, i|
            puts "#{i}. #{recipe.name}"
        end
    end
end

