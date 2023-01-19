SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v42 = v42.deScratch(maxwidth=5, mindif=1)

v42_m = v42.PrepareMask

v42 = v42.convertToRGB32(interlaced=false, matrix="PC.709")

v42 = v42.ExInpaint(mask = v42_m)
v42 = v42.convertToYV24(interlaced=false)

va = BlankClip(v42, audio_rate = 48000, channels = 2).killVideo
v42 = v42.audioDub(va)

last = v42
prefetch

