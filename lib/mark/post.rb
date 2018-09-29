module Mark
  class Post
    attr_reader :meta, :content

    def initialize(path)
      @file_contents = File.read(path)
      parse
    end

    private

    def parse
      split_content = @file_contents.split(/^---/, 3)
      split_content.shift

      @meta = YAML::load split_content.shift

      @meta['date'] = Date.strptime(@meta['date'], '%m/%d/%Y')

      @content = Tilt::RedcarpetTemplate.new { split_content.shift }.render
    end
  end
end
