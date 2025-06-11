# 🎞️ Open-Sora Batch Prompt Renderer

This is a simple shell script to automate **video generation from prompts** using the [Open-Sora](https://github.com/Open-Sora/Open-Sora) framework. I created it with the help of ChatGPT. 

## 🪄 What It Does

You provide a list of text prompts — each describing a whimsical, fantasy, or photographic scene — and the script will generate a separate video for each one using Open-Sora + Flux, with no need for manual input or image conditioning.

---

## 📋 Requirements

- Linux or WSL (Windows Subsystem for Linux)
- [Open-Sora](https://github.com/Open-Sora/Open-Sora) properly installed and working
- CUDA-compatible GPU with plenty of VRAM (e.g., 4070 or better)
- Python 3.10 and a working virtual environment
- The script assumes you're using the `t2i2v_256px.py` config and no image conditioning

---

## 📦 Files Included

- `batch_render.sh` — Main script to loop through prompts and render videos
- `prompts.txt` — Sample prompt file (one prompt per line)

---

## ✍️ How to Use

1. **Clone this repo** or download the files into your `Open-Sora` directory.

    ```bash
    git clone https://github.com/HelloJessicaM/open-sora-batch-render.git
    cd open-sora-batch-render
    ```

2. **Edit `prompts.txt`** and add one prompt per line. Example:
    ```
    unicorn and maiden in foggy meadow, 19th-century fantasy scene
    fairy child asleep in a tulip, storybook style
    moss-covered dryad in forest glade, by Cicely Mary Barker
    ```

3. **Make the script executable:**

    ```bash
    chmod +x batch_render.sh
    ```

4. **Run the script from your Open-Sora virtual environment:**

    ```bash
    ./batch_render.sh
    ```

5. **Output:** Each video will be saved in:
    - `samples/video_256px/video_XXXX/prompt_XXXX.mp4`
    - and copied again as `samples/rendered_prompt_XXXX.mp4`

---

## 🎨 Prompt Ideas

Great results come from vivid, visual language. Try phrases like:

- `tiny fairy brushing a bumblebee’s wings, soft pastel art`
- `victorian fairy with gossamer wings in a woodland glade, by Julia Margaret Cameron`
- `flower fairies having a picnic on a lily pad, by Cicely Mary Barker`

---

## 🛠️ Customization

You can edit the render settings inside `batch_render.sh`:
- Change `--num-frames`, `--width`, `--height`, etc.
- Add `--seed` if you want repeatable results

Want to add image conditioning? Just uncomment and modify the `--image_cond_path` line.

---

## 🧚‍♀️ License

MIT — Use freely, remix, and fly with it. 🌸
