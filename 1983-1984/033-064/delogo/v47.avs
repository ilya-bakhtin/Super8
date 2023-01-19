SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v47 = v47.deScratch(maxwidth=5, mindif=1)

v47_m = v47.PrepareMask(mask_tolerance = 200)

v47 = v47.convertToRGB32(interlaced=false, matrix="PC.709")
#return v47.interleave(v47_m)
v47 = v47.ExInpaint(mask = v47_m)
v47 = v47.convertToYV24(interlaced=false)

va = BlankClip(v47, audio_rate = 48000, channels = 2).killVideo
v47 = v47.audioDub(va)

last = v47
prefetch

