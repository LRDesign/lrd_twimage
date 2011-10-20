module Twimage
  class Image
    
    attr_reader :service, :service_url, :image_url, :tempfile
    
    def initialize(options)
      @service      = options[:service]
      @service_url  = options[:service_url]
      @image_url    = options[:image_url]
      
      begin
        extension = @image_url.match(/(\.\w+)(\?|$)/)[1]
      rescue NoMethodError
        extension = '.jpg'    # Lockerz does not put extensions or mime types on their images.
      end
      @tempfile = Tempfile.new(['twimage', extension])
      @tempfile << options[:image]
    end
    
  end
end
