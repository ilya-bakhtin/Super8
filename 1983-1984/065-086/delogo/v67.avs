SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v67 = v67.deScratch(maxwidth=5, mindif=1)

v67_m = v67.PrepareMask

v67 = v67.convertToRGB32(interlaced=false, matrix="PC.709")

v67 = v67.ExInpaint(mask = v67_m)
v67 = v67.convertToYV24(interlaced=false)

va = BlankClip(v67, audio_rate = 48000, channels = 2).killVideo
v67 = v67.audioDub(va)

last = v67
prefetch

