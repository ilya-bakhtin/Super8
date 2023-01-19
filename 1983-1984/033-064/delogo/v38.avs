SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v38 = v38.deScratch(maxwidth=5, mindif=1)

v38_m = v38.PrepareMask

v38 = v38.convertToRGB32(interlaced=false, matrix="PC.709")

v38 = v38.ExInpaint(mask = v38_m)
v38 = v38.convertToYV24(interlaced=false)

va = BlankClip(v38, audio_rate = 48000, channels = 2).killVideo
v38 = v38.audioDub(va)

last = v38
prefetch

