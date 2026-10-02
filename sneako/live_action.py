"""Live-action (photoreal) test versions of scenes 1-10.

Real people are never shown: everyone is an anonymous stand-in whose face is
turned away, in shadow, or out of focus.
"""
STYLE = (
    "Photorealistic live-action film still, cinematic documentary look, natural "
    "lighting, shot on 35mm, shallow depth of field, wide 16:9 frame. All people "
    "are anonymous actors who do not resemble any real person; their faces are "
    "turned away, in shadow, or out of focus. Any text is short, in capital "
    "letters, and spelled exactly as given. No real company or platform logos."
)

SCENES = {
    1: "A young man in a backwards cap and hoodie, seen from behind, standing in a dim corridor facing four closed doors. Plain printed paper signs on the doors read 'YOUTUBE', 'TWITCH', 'KICK' and 'TIKTOK', and each door has a big red 'BANNED' sticker.",
    2: "A young man in a backwards cap, face hidden in shadow under the brim, shrugging at a cluttered desk covered in red rubber stamps that say 'BANNED'.",
    3: "At an airport at night, a young man in a backwards cap seen from behind stands outside a tall chain-link fence. A large official sign on the fence reads 'ENTRY DENIED' and a smaller sign reads '2026'.",
    4: "A silhouetted wealthy man in a dark suit, face completely in shadow, stands at the window of a luxury penthouse and points toward a TV screen showing a young man in a backwards cap. A headline bar on the TV reads 'SEND HIM AWAY'.",
    5: "Close-up of a man's hands gripping jail cell bars, his face lost in darkness behind the bars. In soft focus outside the cell, a young man in a backwards cap looks back over his shoulder, confused.",
    6: "A lone young man in a backwards cap, seen from behind, stands in the middle of a street. On the left a crowd holds signs reading 'LEFT', on the right a crowd holds signs reading 'RIGHT', and both crowds point megaphones at him.",
    7: "Night city street: a young man in a backwards cap holding a phone on a selfie stick, seen from behind, surrounded on all sides by a crowd of angry, blurred faces. A small wall calendar in the foreground reads '2026'.",
    8: "Close-up of a paper wall calendar pinned to a brick wall, turned to the page 'APRIL', in warm morning light.",
    9: "A young man in a backwards cap walking down a busy Manhattan sidewalk, shot from behind and to the side, looking at a phone on a gimbal. The phone screen shows a red 'LIVE' badge.",
    10: "Shaky phone-camera point of view on a city sidewalk: a stranger's fist swings toward the lens with heavy motion blur, the frame tilting as the phone falls. A red 'LIVE' badge in the corner of the frame. No blood, no injuries shown.",
}

if __name__ == "__main__":
    for i, s in SCENES.items():
        print(i, f"{s}\n\nStyle: {STYLE}")
