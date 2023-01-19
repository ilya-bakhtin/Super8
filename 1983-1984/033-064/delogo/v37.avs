SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v37 = v37.deScratch(maxwidth=5, mindif=1)

v37_m = v37.PrepareMask

v37 = v37.convertToRGB32(interlaced=false, matrix="PC.709")

v37 = v37.ExInpaint(mask = v37_m)
v37 = v37.convertToYV24(interlaced=false)

va = BlankClip(v37, audio_rate = 48000, channels = 2).killVideo
v37 = v37.audioDub(va)

last = v37
prefetch

