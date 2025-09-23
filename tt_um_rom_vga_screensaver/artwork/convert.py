from PIL import Image

SIZE = (64, 64)

# Input and output file paths
input_path = "logo.png"
output_png_path = "../logo_6bpp.png"
output_bin_path = "logo_6bpp.bin"
output_hex_path = "../src/logo_6bpp.hex"

# Open the input image
img = Image.open(input_path)

img_resized = img.resize(SIZE, Image.LANCZOS)

# Convert to 6bpp (2 bits per channel for R, G, B)
def to_6bpp(img):
    img_6bpp = img.convert("RGB")
    pixels = img_6bpp.load()
    pixel_data = bytearray(img.width * img.height)
    for y in range(img.height):
        for x in range(img.width):
            r, g, b = pixels[x, y]
            r2, g2, b2 = (r >> 6), (g >> 6), (b >> 6)
            pixel_data[y * img.width + x] = (r2 << 4) | (g2 << 2) | b2
            pixels[x, y] = (r2 * 85, g2 * 85, b2 * 85)
    return img_6bpp, pixel_data

# Convert to 6bpp and save both a png preview and a binary file
img_6bpp, pixel_data = to_6bpp(img_resized)
img_6bpp.save(output_png_path, format="PNG")

with open(output_bin_path, "wb") as f:
    f.write(pixel_data)

with open(output_hex_path, "w") as f:
    for byte in pixel_data:
        f.write(f"{byte:02X}\n")

print(f"Converted {input_path} to 6bpp and saved as: ")
print(f" - PNG preview: {output_png_path}")
print(f" - Binary file: {output_bin_path} (for ROM macro generation)")
print(f" - Hex file: {output_hex_path} (for verilog ROM initialization)")
