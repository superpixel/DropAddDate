# About Any2sRGB

Any2sRGB is a simple droplet wrapper around the *sips* command line tool. It saves a color matched copy of TIFF, JPEG and Photoshop images with an sRGB color profile.

## Installation

1. Clone or download the repository to your Mac.
2. Drag & Drop the file *compile.sh* into a Terminal.app window and press Enter.
3. Any2sRGB will be compiled and afterwards you can move the application wherever you want.

## Usage

Launch Any2sRGB to choose multiple image files to color match them to sRGB (or just Drag & Drop them onto the application).

The color matched copies will be placed next to their input with "_sRGB" added after the name and before the name extension. The color conversion happens with the rendering intent *relative*. Photoshop images are flattened to the background layer.