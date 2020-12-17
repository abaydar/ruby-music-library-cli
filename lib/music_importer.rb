class MusicImporter

    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
        #binding.pry
      end

    # def files
    #     files_array = Dir['./spec/fixtures/mp3s/**.mp3']
    #     normalized_files = files_array.map{|files| files.split("/")}.map{|file_name| file_name.pop}
    #     binding.pry
    # end

    def import
        files.each{|file| Song.create_from_filename(file)}
        #binding.pry
    end
end