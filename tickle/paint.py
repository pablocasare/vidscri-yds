"""Tiny toolkit for crude MS Paint-style drawings: wobbly thick lines,
stick figures, and shaky text on a white 1920x1080 canvas."""
import math
import random

from PIL import Image, ImageDraw, ImageFont

W, H = 1920, 1080
BLACK = (0, 0, 0)
FONT = "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf"


class Canvas:
    def __init__(self, seed=0):
        self.rng = random.Random(seed)
        self.img = Image.new("RGB", (W, H), "white")
        self.d = ImageDraw.Draw(self.img)

    def save(self, path):
        self.img.save(path)

    # --- primitives -------------------------------------------------------
    def _jit(self, amt):
        return self.rng.uniform(-amt, amt)

    def line(self, pts, width=9, color=BLACK, wobble=4):
        """Polyline through pts, subdivided and jittered so it looks hand drawn."""
        out = []
        for (x1, y1), (x2, y2) in zip(pts, pts[1:]):
            n = max(2, int(math.hypot(x2 - x1, y2 - y1) / 25))
            for i in range(n):
                t = i / n
                out.append((x1 + (x2 - x1) * t + self._jit(wobble),
                            y1 + (y2 - y1) * t + self._jit(wobble)))
        out.append(pts[-1])
        for a, b in zip(out, out[1:]):
            w = max(4, int(width + self._jit(2.5)))
            self.d.line([a, b], fill=color, width=w)
            self.d.ellipse([b[0] - w / 2, b[1] - w / 2, b[0] + w / 2, b[1] + w / 2], fill=color)

    def circle(self, cx, cy, r, width=9, color=BLACK, fill=None, wobble=4):
        n = max(16, int(r / 4))
        start = self.rng.uniform(0, math.tau)
        pts = [(cx + (r + self._jit(wobble)) * math.cos(start + math.tau * i / n),
                cy + (r + self._jit(wobble)) * math.sin(start + math.tau * i / n))
               for i in range(n + 1)]
        pts.append((pts[1][0] + self._jit(3), pts[1][1] + self._jit(3)))  # sloppy overlap
        if fill:
            self.d.polygon(pts[:-2], fill=fill)
        self.line(pts, width, color, wobble=1.5)

    def ellipse(self, cx, cy, rx, ry, width=9, color=BLACK, fill=None):
        n = 28
        pts = [(cx + rx * math.cos(math.tau * i / n) + self._jit(3),
                cy + ry * math.sin(math.tau * i / n) + self._jit(3)) for i in range(n + 1)]
        if fill:
            self.d.polygon(pts, fill=fill)
        self.line(pts, width, color, wobble=1.5)

    def rect(self, x1, y1, x2, y2, width=9, color=BLACK, fill=None):
        if fill:
            self.d.polygon([(x1 + self._jit(4), y1 + self._jit(4)), (x2 + self._jit(4), y1),
                            (x2, y2 + self._jit(4)), (x1, y2)], fill=fill)
        self.line([(x1, y1), (x2, y1), (x2, y2), (x1, y2), (x1, y1 + 4)], width, color)

    def text(self, x, y, s, size=70, color=BLACK, angle=None):
        font = ImageFont.truetype(FONT, size)
        box = self.d.textbbox((0, 0), s, font=font)
        tw, th = box[2] - box[0] + 20, box[3] - box[1] + 30
        layer = Image.new("RGBA", (tw, th), (255, 255, 255, 0))
        ImageDraw.Draw(layer).text((10, 5 - box[1]), s, font=font, fill=color)
        layer = layer.rotate(angle if angle is not None else self._jit(4), expand=True,
                             resample=Image.BICUBIC)
        self.img.paste(layer, (int(x - layer.width / 2), int(y - layer.height / 2)), layer)

    # --- symbols ----------------------------------------------------------
    def question(self, x, y, s=1.0, color=BLACK):
        self.text(x, y, "?", int(150 * s), color)

    def exclaim(self, x, y, s=1.0, color=(220, 30, 30)):
        self.text(x, y, "!", int(150 * s), color)

    def motion(self, x, y, n=3, length=50, angle=0, gap=24):
        for i in range(n):
            ox = -math.sin(angle) * gap * (i - (n - 1) / 2)
            oy = math.cos(angle) * gap * (i - (n - 1) / 2)
            self.line([(x + ox, y + oy),
                       (x + ox + length * math.cos(angle), y + oy + length * math.sin(angle))], 6)

    def squiggle(self, x, y, length=60, color=BLACK):
        pts = [(x + i * length / 8, y + (12 if i % 2 else -12)) for i in range(9)]
        self.line(pts, 6, color, wobble=2)

    def laugh(self, x, y):
        """Little 'ha ha' laugh squiggles."""
        self.text(x, y, "HA", 48, angle=self._jit(15))
        self.text(x + 70, y - 50, "HA", 40, angle=self._jit(15))
        self.squiggle(x - 30, y + 55, 70)

    def sweat(self, x, y):
        self.d.polygon([(x, y - 18), (x - 10, y + 5), (x + 10, y + 5)], fill=(90, 170, 255))
        self.d.ellipse([x - 10, y - 5, x + 10, y + 15], fill=(90, 170, 255))

    def heart(self, x, y, s=1.0, color=(230, 40, 60)):
        pts = []
        for i in range(40):
            t = math.tau * i / 40
            pts.append((x + s * 16 * math.sin(t) ** 3 * 4,
                        y - s * (13 * math.cos(t) - 5 * math.cos(2 * t)
                                 - 2 * math.cos(3 * t) - math.cos(4 * t)) * 4))
        self.d.polygon(pts, fill=color)
        self.line(pts + [pts[0]], 7, wobble=1)

    def arrow(self, a, b, width=8, color=BLACK):
        self.line([a, b], width, color)
        ang = math.atan2(b[1] - a[1], b[0] - a[0])
        for da in (2.6, -2.6):
            self.line([b, (b[0] + 40 * math.cos(ang + da), b[1] + 40 * math.sin(ang + da))],
                      width, color)

    # --- stick figure -----------------------------------------------------
    def person(self, x, y, s=1.0, mouth="smile", eyes="dots", arms=None, legs=None,
               head_fill=None, hair=None, look=0):
        """Stick figure standing with feet near (x, y). Returns key joint points.

        arms / legs: list of two (dx, dy) hand/foot offsets relative to the
        shoulder / hip, in unscaled units. mouth: smile, flat, frown, open, laugh,
        wavy. eyes: dots, closed, wide.
        """
        r = 55 * s
        hip = (x, y - 170 * s)
        neck = (x, hip[1] - 170 * s)
        head = (x, neck[1] - r)
        shoulder = (x, neck[1] + 30 * s)
        legs = legs or [(-60, 170), (60, 170)]
        arms = arms or [(-90, 110), (90, 110)]

        self.circle(*head, r, fill=head_fill or "white")
        if hair == "long":
            self.line([(head[0] - r * 0.9, head[1] - r * 0.3), (head[0] - r * 1.1, head[1] + r * 1.4)], 9)
            self.line([(head[0] + r * 0.9, head[1] - r * 0.3), (head[0] + r * 1.1, head[1] + r * 1.4)], 9)
            self.line([(head[0] - r * 0.9, head[1] - r * 0.4), (head[0], head[1] - r * 1.05),
                       (head[0] + r * 0.9, head[1] - r * 0.4)], 11)
        self.line([neck, hip])
        hands = []
        for dx, dy in arms:
            hand = (shoulder[0] + dx * s, shoulder[1] + dy * s)
            self.line([shoulder, hand])
            hands.append(hand)
        feet = []
        for dx, dy in legs:
            foot = (hip[0] + dx * s, hip[1] + dy * s)
            self.line([hip, foot])
            feet.append(foot)

        ex = head[0] + look * r * 0.3
        ey = head[1] - r * 0.15
        for side in (-1, 1):
            px = ex + side * r * 0.35
            if eyes == "closed":
                self.line([(px - 9 * s, ey), (px + 9 * s, ey)], 6)
            elif eyes == "wide":
                self.circle(px, ey, 14 * s, width=5, wobble=1)
                self.d.ellipse([px - 5, ey - 5, px + 5, ey + 5], fill=BLACK)
            else:
                self.d.ellipse([px - 7 * s, ey - 7 * s, px + 7 * s, ey + 7 * s], fill=BLACK)
        my = head[1] + r * 0.4
        mx = head[0] + look * r * 0.3
        mw = r * 0.4
        if mouth == "smile":
            self.line([(mx - mw, my - 6 * s), (mx, my + 10 * s), (mx + mw, my - 6 * s)], 6)
        elif mouth == "frown":
            self.line([(mx - mw, my + 8 * s), (mx, my - 8 * s), (mx + mw, my + 8 * s)], 6)
        elif mouth == "flat":
            self.line([(mx - mw, my), (mx + mw, my)], 6)
        elif mouth == "wavy":
            self.line([(mx - mw, my), (mx - mw / 2, my - 6), (mx, my + 6),
                       (mx + mw / 2, my - 6), (mx + mw, my)], 5)
        elif mouth in ("open", "laugh"):
            self.d.ellipse([mx - mw * 0.8, my - 12 * s, mx + mw * 0.8, my + 20 * s],
                           fill=(170, 20, 30) if mouth == "laugh" else BLACK)
        return {"head": head, "r": r, "neck": neck, "shoulder": shoulder, "hip": hip,
                "hands": hands, "feet": feet}

    def bare_foot(self, x, y, s=1.0, angle=0):
        """Side view of a bare foot, sole facing down-right; returns sole centre."""
        def rot(px, py):
            ca, sa = math.cos(angle), math.sin(angle)
            return (x + (px * ca - py * sa) * s, y + (px * sa + py * ca) * s)
        outline = [(-40, -120), (-40, -20), (-60, 20), (-40, 45), (60, 45), (130, 30),
                   (140, 5), (100, -10), (20, -30), (15, -120)]
        self.d.polygon([rot(*p) for p in outline], fill=(255, 220, 185))
        self.line([rot(*p) for p in outline], 9)
        for i, tx in enumerate((95, 112, 126, 136)):
            self.circle(*rot(tx, -2 - i * 2), 9 * s, width=5, wobble=1, fill=(255, 220, 185))
        return rot(40, 45)

    def brain(self, cx, cy, s=1.0, fill=(255, 170, 190)):
        self.ellipse(cx, cy, 170 * s, 115 * s, fill=fill)
        for dx, dy, l in ((-80, -40, 60), (10, -60, 70), (70, 10, 50), (-40, 30, 70), (40, 60, 50)):
            x0, y0 = cx + dx * s, cy + dy * s
            self.line([(x0, y0), (x0 + l * 0.3 * s, y0 - 20 * s), (x0 + l * 0.6 * s, y0 + 10 * s),
                       (x0 + l * s, y0 - 10 * s)], 6)
