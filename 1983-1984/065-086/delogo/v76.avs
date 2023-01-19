SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v76 = v76.deScratch(maxwidth=5, mindif=1)

v76_m = v76.PrepareMask(mask_tolerance = 200)

v76 = v76.convertToRGB32(interlaced=false, matrix="PC.709")

v76 = v76.ExInpaint(mask = v76_m)
v76 = v76.convertToYV24(interlaced=false)

va = BlankClip(v76, audio_rate = 48000, channels = 2).killVideo
v76 = v76.audioDub(va)

last = v76
prefetch

