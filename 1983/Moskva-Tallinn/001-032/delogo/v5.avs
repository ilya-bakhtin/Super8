SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("c:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

v5_m = v5.PrepareMask(mask_w = 140, mask_h = 100, mask_tolerance = 200)

v5 = v5.convertToRGB32(interlaced=false, matrix="PC.709")

v5 = v5.ExInpaint(mask = v5_m)
v5 = v5.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip(v5, audio_rate = 48000, channels = 2).killVideo
v5 = v5.audioDub(va)

last = v5
prefetch

