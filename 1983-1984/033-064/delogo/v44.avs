SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v44 = v44.deScratch(maxwidth=5, mindif=1)

v44_m = v44.PrepareMask(mask_tolerance = 200)

v44 = v44.convertToRGB32(interlaced=false, matrix="PC.709")

v44 = v44.ExInpaint(mask = v44_m)
v44 = v44.convertToYV24(interlaced=false)

va = BlankClip(v44, audio_rate = 48000, channels = 2).killVideo
v44 = v44.audioDub(va)

last = v44
prefetch

