## Inlining images and fonts

When webpack parses your html and css files, it will find instances of `url()` and `src="somefile.png` and automatically insert either a base 64 encoded data url string, or a relative link to the destination file.