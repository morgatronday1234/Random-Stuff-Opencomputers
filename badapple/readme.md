Converter commands:

`ffmpeg -i VideoFile.mp4 -pix_fmt gray "videoToImagesFolder/%d.bmp"`

(Requires 'ascii-magic')
```python 
from ascii_magic import AsciiArt as ascii
import os

inputFolder = "videoToImagesFolder"+"/"
outputFolder =  "imagesToTextFolder"+"/"
colliums = 80

def getAss(file, pixSca):
  return ascii.from_image(inputFolder+file).to_ascii(pixSca, monochrome=True)

for file in os.listdir(inputFolder):
  outputText = getAss(file, colliums)
  with open(outputFolder+file+".txt", "w") as outputFile:
    outputFile.write(outputText)
```

(Video used in outputv4: https://youtu.be/9lNZ_Rnr7Jc?si=f5SnubGf_HrkCXDP)
