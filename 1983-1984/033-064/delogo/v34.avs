SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v34 = v34.deScratch(maxwidth=5, mindif=1)

v34_m = v34.PrepareMask

v34 = v34.convertToRGB32(interlaced=false, matrix="PC.709")

v34 = v34.ExInpaint(mask = v34_m)
v34 = v34.convertToYV24(interlaced=false)

va = BlankClip(v34, audio_rate = 48000, channels = 2).killVideo
v34 = v34.audioDub(va)

last = v34
prefetch

