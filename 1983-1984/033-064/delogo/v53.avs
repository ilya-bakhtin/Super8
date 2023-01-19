SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983-1984\\033-064\\delogo\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#v53 = v53.deScratch(maxwidth=5, mindif=1)

v53_m = v53.PrepareMask(mask_tolerance = 200)

v53 = v53.convertToRGB32(interlaced=false, matrix="PC.709")

v53 = v53.ExInpaint(mask = v53_m)
v53 = v53.convertToYV24(interlaced=false)

va = BlankClip(v53, audio_rate = 48000, channels = 2).killVideo
v53 = v53.audioDub(va)

last = v53
prefetch

