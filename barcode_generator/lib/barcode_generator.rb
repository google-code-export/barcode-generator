# BarcodeGenerator
# uses Gbarcode for encoding barcode data and then rmagick to generate
# images out of it for displaying in views.

# i was using clumsy file.new and file.close for eps generation, but 
# Adam Feuer had published a much elegant way by using IO.pipe for doing
# same thing. (never occured to me !! :-P )

# this way we can generate any barcode type which Gbarcode -> Gnome Barcode project
# supports.

# Extending <tt>ActionView::Base</tt> to support rendering themes
require 'imagemagick_wrapper'
module ActionView
   # Extending <tt>ActionView::Base</tt> to support rendering themes
   class Base
    include ImageMagickWrapper
    def barcode(id, options = {:encoding_format => DEFAULT_ENCODING })
      id.upcase!
      normalized_id = ASTERISKIZE ? "*#{id}*" : id
      eps = "#{RAILS_ROOT}/public/images/barcodes/#{id}.eps"
      out = "#{RAILS_ROOT}/public/images/barcodes/#{id}.#{DEFAULT_FORMAT}"
      unless File.exists?(out)
        #generate the barcode object 
        options[:encoding_format] = DEFAULT_ENCODING unless options[:encoding_format]
        bc = Gbarcode.barcode_create(normalized_id)
        bc.width  = options[:width]          if options[:width]
        bc.height = options[:height]         if options[:height]
        bc.scalef = options[:scaling_factor] if options[:scaling_factor]
        bc.xoff   = options[:xoff]           if options[:xoff]
        bc.yoff   = options[:yoff]           if options[:yoff]
        bc.margin = options[:margin]         if options[:margin]
        Gbarcode.barcode_encode(bc, options[:encoding_format])
        #encode the barcode object in desired format
        File.open(eps,'wb') do |eps_img| 
          Gbarcode.barcode_print(bc, eps_img, Gbarcode::BARCODE_OUT_EPS)
          eps_img.close
          convert_to_png(eps, out)
          File.delete(eps)
        end
      end
      image_tag("barcodes/#{id}.png")
    end
   end
 end
