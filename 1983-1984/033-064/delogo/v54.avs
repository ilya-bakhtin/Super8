SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v54 = v54.deScratch(maxwidth=5, mindif=1)

v54_m = v54.PrepareMask(mask_tolerance = 200)

v54 = v54.convertToRGB32(interlaced=false, matrix="PC.709")

v54 = v54.ExInpaint(mask = v54_m)
v54 = v54.convertToYV24(interlaced=false)

va = BlankClip(v54, audio_rate = 48000, channels = 2).killVideo
v54 = v54.audioDub(va)

last = v54
prefetch

