#!/bin/bash

# Ensure the input file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <input-file>"
  exit 1
fi

INPUT_FILE="$1"
OUTPUT_DIR="streamdeck_output"
GRID_COLS=5
GRID_ROWS=3
BUTTON_SIZE=72
OUTPUT_WIDTH=$((GRID_COLS * BUTTON_SIZE))
OUTPUT_HEIGHT=$((GRID_ROWS * BUTTON_SIZE))

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Resize the input animation to fit the Stream Deck grid
magick "$INPUT_FILE" -resize ${OUTPUT_WIDTH}x${OUTPUT_HEIGHT}! "$OUTPUT_DIR/resized_input.gif"

# Loop through the grid and crop each segment
for ((i=0; i<GRID_ROWS; i++)); do
  for ((j=0; j<GRID_COLS; j++)); do
    x_offset=$((j * BUTTON_SIZE))
    y_offset=$((i * BUTTON_SIZE))
    ROW=$((i + 1))
    COL=$((j + 1))
    OUTPUT_GIF="$OUTPUT_DIR/Row${ROW}-${COL}.gif"
    
    magick "$OUTPUT_DIR/resized_input.gif" -crop ${BUTTON_SIZE}x${BUTTON_SIZE}+$x_offset+$y_offset +repage "$OUTPUT_GIF"
  done
done

echo "GIFs generated in $OUTPUT_DIR"
