from pathlib import Path
from PIL import Image, ImageDraw

root = Path(__file__).resolve().parent
pages = sorted(root.glob("page-*.png"))
per_sheet = 6
cols = 2
thumb_w = 620
margin = 24
label_h = 28

for sheet_index in range(0, len(pages), per_sheet):
    group = pages[sheet_index:sheet_index + per_sheet]
    thumbs = []
    for path in group:
        image = Image.open(path).convert("RGB")
        ratio = thumb_w / image.width
        thumb = image.resize((thumb_w, int(image.height * ratio)))
        thumbs.append((path, thumb))
    rows = (len(thumbs) + cols - 1) // cols
    cell_h = max(img.height for _, img in thumbs) + label_h
    sheet = Image.new("RGB", (cols * thumb_w + (cols + 1) * margin, rows * cell_h + (rows + 1) * margin), "#dfe4ec")
    draw = ImageDraw.Draw(sheet)
    for idx, (path, thumb) in enumerate(thumbs):
        row, col = divmod(idx, cols)
        x = margin + col * (thumb_w + margin)
        y = margin + row * (cell_h + margin)
        draw.text((x, y), path.stem.upper(), fill="#13213c")
        sheet.paste(thumb, (x, y + label_h))
    out = root / f"contact-{sheet_index // per_sheet + 1:02d}.png"
    sheet.save(out, optimize=True)
