SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v57 = v57.deScratch(maxwidth=5, mindif=1)

v57_m = v57.PrepareMask

v57 = v57.convertToRGB32(interlaced=false, matrix="PC.709")

v57 = v57.ExInpaint(mask = v57_m)
v57 = v57.convertToYV24(interlaced=false)

va = BlankClip(v57, audio_rate = 48000, channels = 2).killVideo
v57 = v57.audioDub(va)

last = v57
prefetch

