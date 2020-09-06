class Tags
    attr_accessor :display_name, :tag_name
    
    @@all_tags = []

    def initialize(display_name, tag_name)
        @display_name = display_name
        @tag_name = tag_name
        save
    end

    def self.all_tags
        @@all_tags
    end
    
    def save
        @@all_tags << self
    end

    def self.display_all_tags
        @@all_tags.each.with_index(1) do |tag, i|
            puts "#{i}. #{tag.display_name}"
        end
    end
end

