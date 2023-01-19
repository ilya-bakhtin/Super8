SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v52 = v52.deScratch(maxwidth=5, mindif=1)

v52_m = v52.PrepareMask(mask_tolerance = 200)

v52 = v52.convertToRGB32(interlaced=false, matrix="PC.709")

v52 = v52.ExInpaint(mask = v52_m)
v52 = v52.convertToYV24(interlaced=false)

va = BlankClip(v52, audio_rate = 48000, channels = 2).killVideo
v52 = v52.audioDub(va)

last = v52
prefetch

