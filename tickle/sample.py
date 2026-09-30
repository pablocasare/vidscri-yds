import math
from paint import Canvas

OUT = "drawn/"

def s001():
    c = Canvas(1)
    floor = 760
    c.line([(300, floor), (1620, floor)], 8)
    p = c.person(820, floor + 170, 1.3, mouth="smile", look=0.6,
                 legs=[(260, -15), (240, 10)], arms=[(230, 60), (-80, 150)])
    c.bare_foot(p["feet"][0][0] + 40, p["feet"][0][1] - 60, 1.1, angle=-1.2)
    c.question(p["head"][0] + 20, p["head"][1] - 190, 1.2)
    c.save(OUT + "001_0-00.png")

def s003():
    c = Canvas(3)
    # left: someone tickles the ribs
    a = c.person(430, 900, 1.1, mouth="laugh", eyes="closed",
                 arms=[(-120, -60), (-40, 170)], legs=[(-90, 170), (40, 170)])
    b = c.person(760, 900, 1.1, mouth="smile", look=-0.8, arms=[(-230, 40), (-200, 70)])
    c.motion(a["shoulder"][0] + 30, a["shoulder"][1] + 70, n=3, length=40)
    c.laugh(260, 260)
    c.text(560, 1010, "SOMEONE ELSE", 52)
    # divider
    c.line([(960, 160), (960, 1000)], 6)
    # right: alone
    d = c.person(1420, 900, 1.1, mouth="flat", arms=[(20, 90), (140, 100)])
    c.text(1420, 1010, "YOU", 52)
    c.save(OUT + "003_0-09.png")

def s004():
    c = Canvas(4)
    p = c.person(960, 870, 1.5, mouth="flat", eyes="dots", arms=[(40, 110), (-150, 140)])
    c.text(960, 980, "...", 90)
    c.save(OUT + "004_0-16.png")

def s007():
    c = Canvas(7)
    floor = 780
    c.line([(250, floor), (1670, floor)], 8)
    p = c.person(820, floor + 170, 1.3, mouth="flat",
                 legs=[(260, -15), (240, 10)], arms=[(250, 20), (230, 70)])
    c.bare_foot(p["feet"][0][0] + 40, p["feet"][0][1] - 60, 1.1, angle=-1.2)
    for k in range(3):
        c.motion(p["hands"][0][0] + 20, p["hands"][0][1] - 80 + k * 70, n=2, length=45, angle=-0.3)
    hx, hy = p["head"]
    for dx, dy in ((-90, -40), (95, -60), (-110, 30), (110, 20)):
        c.sweat(hx + dx, hy + dy)
    c.text(1400, 300, "NOPE.", 90)
    c.save(OUT + "007_0-29.png")

for f in (s001, s003, s004, s007):
    f()
