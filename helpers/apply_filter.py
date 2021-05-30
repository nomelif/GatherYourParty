# Usage: python apply_filter.py filter.blend sprite_name_1.png sprite_glob_2*.png sprite_name_3.png

import sys
import subprocess

print(sys.argv[2:])
f = sys.argv[1]
for image in sys.argv[2:]:
    subprocess.run(["./call_blender", f, "-b", "--python-text", "Call_filter", "-f", "1", "--", image])
    subprocess.run(["mv", "/tmp/0001.png", image])
