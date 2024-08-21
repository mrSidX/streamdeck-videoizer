# streamdeck-videoizer

******This will convert GIFS into animated icon segments to use with Stream Deck******


DESCRIPTION OF FUNCTION:

Converts GIFS (and potentially videos) to animated segments that can be used with Stream Deck.
Put icons in place accordingly to create a full screen (on Stream Deck) animation of that original GIF.


OVERVIEW:
Takes an animated GIF and chops it up for Stream Deck (5 * 3)

INSTALLATION:
-Create a folder on your computer and copy this script into it.
-Download your video and convert it to GIF (not tested with videos yet, but intended to be capable)
-You can run a command in Windows (WSL), or Linux / Mac:
``` ./streamdeck-videoizer.sh <name-of-your-animation-gif-or-video>.gif ```

This will create an output directory with your video segments chopped up.
You will see a row and a column associated in the file name for easy placement.



REFERENCES:

Convert to GIF via EZGIF online.
https://ezgif.com/webp-to-gif
