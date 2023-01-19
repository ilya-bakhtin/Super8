SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v61 = v61.deScratch(maxwidth=5, mindif=1)

v61_m = v61.PrepareMask

v61 = v61.convertToRGB32(interlaced=false, matrix="PC.709")

v61 = v61.ExInpaint(mask = v61_m)
v61 = v61.convertToYV24(interlaced=false)

va = BlankClip(v61, audio_rate = 48000, channels = 2).killVideo
v61 = v61.audioDub(va)

last = v61
prefetch

