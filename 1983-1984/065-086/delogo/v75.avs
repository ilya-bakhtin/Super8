SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v75 = v75.deScratch(maxwidth=5, mindif=1)

v75_m = v75.PrepareMask(mask_tolerance = 200)

v75 = v75.convertToRGB32(interlaced=false, matrix="PC.709")

v75 = v75.ExInpaint(mask = v75_m)
v75 = v75.convertToYV24(interlaced=false)

va = BlankClip(v75, audio_rate = 48000, channels = 2).killVideo
v75 = v75.audioDub(va)

last = v75
prefetch

