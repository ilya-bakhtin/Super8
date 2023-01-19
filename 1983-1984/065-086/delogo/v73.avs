SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v73 = v73.deScratch(maxwidth=5, mindif=1)

v73_m = v73.PrepareMask(mask_tolerance = 200)

v73 = v73.convertToRGB32(interlaced=false, matrix="PC.709")

v73 = v73.ExInpaint(mask = v73_m)
v73 = v73.convertToYV24(interlaced=false)

va = BlankClip(v73, audio_rate = 48000, channels = 2).killVideo
v73 = v73.audioDub(va)

last = v73
prefetch

