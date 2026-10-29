import os
import sys
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))), 'demo', 'report'))
import lead_verify as lv  # noqa: E402
from PIL import Image, ImageDraw, ImageFont  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
PACK = os.path.join(ROOT, 'demo', 'out', 'Pudding Sword Cursor')
OUT = os.path.join(ROOT, 'demo', 'out', 'previews', 'pudding-sword', 'diagonal_check.png')
ITEMS = [
    ('11 SizeNWSE.ani', 'SizeNWSE  左上↖ / 右下↘'),
    ('12 SizeNESW.ani', 'SizeNESW  右上↗ / 左下↙'),
]
try:
    font = ImageFont.truetype('C:/Windows/Fonts/msyh.ttc', 15)
except Exception:
    font = ImageFont.load_default()

sheet = Image.new('RGB', (2 * 300 + 8, 336), (18, 18, 22))
draw = ImageDraw.Draw(sheet)
for i, (name, label) in enumerate(ITEMS):
    res = lv.parse_ani(os.path.join(PACK, name))
    im = res['frames'][0].resize((288, 288), Image.NEAREST)
    bg = Image.new('RGB', (288, 288), (238, 238, 243))
    bg.paste(im, (0, 0), im)
    sheet.paste(bg, (i * 300 + 4, 34))
    draw.text((i * 300 + 6, 8), label, fill=(240, 240, 245), font=font)

os.makedirs(os.path.dirname(OUT), exist_ok=True)
sheet.save(OUT)
print('Saved:', OUT)
