class Controller
    def goodbye
        puts "Goodbye!"
    end
    def call
        input = nil
            puts "Welcome!"
            puts "Here are all the categories you can browse recipes for:"
                API.tags_list_api   
                Tags.display_all_tags 
            #Tags.display_all_tags
            puts "Enter the number of the category you would like:"
            input = gets.strip.downcase
            while input != 'exit' or input.to_i > 0
            if input.to_i > 0
                $tag_input = Tags.all_tags[input.to_i-1].tag_name
                puts "Fetching recipes for #{Tags.all_tags[input.to_i-1].display_name}!"
                API.recipes_list_api
                recipes
            elsif input == "categories"   
                Tags.display_all_tags 
            elsif input == "exit"
                goodbye
            else 
                puts "Not sure which one you want.. "
                puts "Type 'categories' or 'exit':"
            end
        end
    end

    def recipes
        input = nil
            Recipes.display_all_recipes
            puts "Here are some recipes you may like!"
            puts "Enter the number of the recipe you would like to view:"
            while input != 'exit'
            input = gets.strip.downcase
            if input.to_i > 0
                i = input.to_i
                puts "You are now viewing recipe: #{Recipes.all_recipes[i-1].name}"
                if Recipes.all_recipes[i-1].description == nil
                    puts "Unfortunately, there is no description provided for this recipe.."
                else
                    puts Recipes.all_recipes[i-1].description
                end
                puts "Step by Step video tutorial: #{Recipes.all_recipes[i-1].video_url}"
                puts "Type 'list to see the recipes again,"
                puts "or type 'exit' to quit"
                input2 = gets.strip.downcase
            elsif input == 'list'
                Recipes.display_all_recipes
                puts "Type 'list' if you would like to see the recipes again,"
                puts "or type 'exit' to quit"
            elsif input == "exit"
                goodbye
            else
                puts "Not sure which one you want.."
                puts "Type 'list' or 'exit':"     
            end
        end
    end
end
