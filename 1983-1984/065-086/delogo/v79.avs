SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v79 = v79.deScratch(maxwidth=5, mindif=1)

v79_m = v79.PrepareMask

v79 = v79.convertToRGB32(interlaced=false, matrix="PC.709")

v79 = v79.ExInpaint(mask = v79_m)
v79 = v79.convertToYV24(interlaced=false)

va = BlankClip(v79, audio_rate = 48000, channels = 2).killVideo
v79 = v79.audioDub(va)

last = v79
prefetch

