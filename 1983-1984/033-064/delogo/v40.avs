SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v40 = v40.deScratch(maxwidth=5, mindif=1)

v40_m = v40.PrepareMask

v40 = v40.convertToRGB32(interlaced=false, matrix="PC.709")

v40 = v40.ExInpaint(mask = v40_m)
v40 = v40.convertToYV24(interlaced=false)

va = BlankClip(v40, audio_rate = 48000, channels = 2).killVideo
v40 = v40.audioDub(va)

last = v40
prefetch

