SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v59 = v59.deScratch(maxwidth=5, mindif=1)

v59_m = v59.PrepareMask

v59 = v59.convertToRGB32(interlaced=false, matrix="PC.709")

v59 = v59.ExInpaint(mask = v59_m)
v59 = v59.convertToYV24(interlaced=false)

va = BlankClip(v59, audio_rate = 48000, channels = 2).killVideo
v59 = v59.audioDub(va)

last = v59
prefetch

