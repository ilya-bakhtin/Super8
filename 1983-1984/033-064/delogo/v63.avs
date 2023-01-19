SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v63 = v63.deScratch(maxwidth=5, mindif=1)

v63_m = v63.PrepareMask

v63 = v63.convertToRGB32(interlaced=false, matrix="PC.709")

v63 = v63.ExInpaint(mask = v63_m)
v63 = v63.convertToYV24(interlaced=false)

va = BlankClip(v63, audio_rate = 48000, channels = 2).killVideo
v63 = v63.audioDub(va)

last = v63
prefetch

