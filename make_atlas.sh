#convert -append Original\ Tiles/*png -interpolate Nearest -filter point -resize 400% atlas.png
montage Visual\ Art/Original\ Tiles/*png -geometry 200x200+0+0 -interpolate Nearest -filter point Visual\ Art/atlas.png
