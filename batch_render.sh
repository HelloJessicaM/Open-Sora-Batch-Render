#!/bin/bash

# File containing your prompts (one per line)
PROMPT_FILE="prompts.txt"

# Path to save the videos
SAVE_DIR="samples"

# Counter for filenames
INDEX=0

# Loop through each prompt in the file
while IFS= read -r PROMPT || [[ -n "$PROMPT" ]]; do
    # Format index as 4-digit number
    PADDED_INDEX=$(printf "%04d" $INDEX)

    # Generate subdirectory for each prompt
    OUTPUT_DIR="$SAVE_DIR/video_256px/video_$PADDED_INDEX"
    mkdir -p "$OUTPUT_DIR"

    # Run Open-Sora inference
    echo "Rendering prompt #$INDEX: $PROMPT"
    torchrun --nproc_per_node=1 --standalone scripts/diffusion/inference.py \
      configs/diffusion/inference/t2i2v_256px.py \
      --save-dir "$OUTPUT_DIR" \
      --prompt "$PROMPT" \
      --num-frames 128 \
      --height 256 \
      --width 448 \
      --fp16

    # Rename video to match index
    mv "$OUTPUT_DIR/prompt_0000.mp4" "$OUTPUT_DIR/prompt_$PADDED_INDEX.mp4"

    # Optional: copy to central output folder
    cp "$OUTPUT_DIR/prompt_$PADDED_INDEX.mp4" "$SAVE_DIR/rendered_prompt_$PADDED_INDEX.mp4"

    ((INDEX++))
done < "$PROMPT_FILE"
