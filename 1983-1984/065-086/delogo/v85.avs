SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v85 = v85.deScratch(maxwidth=5, mindif=1)

v85_m = v85.PrepareMask

v85 = v85.convertToRGB32(interlaced=false, matrix="PC.709")

v85 = v85.ExInpaint(mask = v85_m)
v85 = v85.convertToYV24(interlaced=false)

va = BlankClip(v85, audio_rate = 48000, channels = 2).killVideo
v85 = v85.audioDub(va)

last = v85
prefetch

