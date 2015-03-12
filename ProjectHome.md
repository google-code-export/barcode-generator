# MOVED TO GITHUB #
http://github.com/anujluthra/barcode-generator/


![http://farm2.static.flickr.com/1378/1125817164_6f57adb24a_o.png](http://farm2.static.flickr.com/1378/1125817164_6f57adb24a_o.png)
# Barcode Generator for Rails - ReDux #


Barcode generator makes generating/displaying barcodes in any format like, PNG,JPEG,JPG etc.. for any alphanumeric id, a piece of cake.

It uses **Gbarcode** for encoding barcode data and **ImageMagick** to generate
images out of it for displaying in views.(yes yes.. you read it correct, its NOT using RMagick anymore)

This way we can generate any barcode type which Gbarcode -> Gnome Barcode project
supports.

## USAGE ##

its as simple as saying
```
<%= barcode 'FJJ4JD'%> 
```
This will generate a barcode for FJJ4JD in BARCODE\_39 format with default width
and height and include it in the view.

![http://farm2.static.flickr.com/1004/1125785568_3a5d7b201b_o.png](http://farm2.static.flickr.com/1004/1125785568_3a5d7b201b_o.png)

the images are stored in /public/images/barcodes subdir.

## Options Options Options .. ##

to customize your barcodes, you can optionally pass following information in your views
  * encoding\_format (Gbarcode constants for eg. Gbarcode::BARCODE\_128 etc..)
  * width
  * height
  * scaling\_factor
  * xoff
  * yoff
  * margin

in this case your view will look like :
```
<%= barcode 'ANUJ', :height => 100, 
                    :width  => 400,
		    :margin => 100,
		    :xoff   => 20,
		    :yoff   => 40
%> 
```
this will produce something beautiful like this ....

![http://farm2.static.flickr.com/1025/1124766953_d158f1c87f_o.png](http://farm2.static.flickr.com/1025/1124766953_d158f1c87f_o.png)


## Installation ##

### Requirements ###
  * ImageMagick (c image manipulation library [more info](http://www.imagemagick.org/script/index.php) )
  * gbarcode (ruby gem:: gem install gbarcode [more info](http://gbarcode.rubyforge.org/rdoc/index.html) )

### install plugin via svn ###
```
script/plugin install http://barcode-generator.googlecode.com/svn/trunk/barcode_generator 

rake barcode_setup
```




## Supported Barcode Formats ##

Gbarcode as of now allows us to generate barcodes in following formats:
```
        BARCODE_EAN
        BARCODE_UPC
        BARCODE_ISBN
        BARCODE_128B
        BARCODE_128C
        BARCODE_128
        BARCODE_128RAW
        BARCODE_39
        BARCODE_I25
        BARCODE_CBR
        BARCODE_MSI
        BARCODE_PLS
        BARCODE_93
        BARCODE_ANY
        BARCODE_NO_CHECKSUM
```
for more information on Gbarcode visit http://gbarcode.rubyforge.org/rdoc/index.html