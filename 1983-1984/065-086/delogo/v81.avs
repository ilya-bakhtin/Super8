SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\065-086\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v81 = v81.deScratch(maxwidth=5, mindif=1)

v81_m = v81.PrepareMask

v81 = v81.convertToRGB32(interlaced=false, matrix="PC.709")

v81 = v81.ExInpaint(mask = v81_m)
v81 = v81.convertToYV24(interlaced=false)

va = BlankClip(v81, audio_rate = 48000, channels = 2).killVideo
v81 = v81.audioDub(va)

last = v81
prefetch

