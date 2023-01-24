SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v19 = v19.deScratch(maxwidth=5, mindif=1)

v19_m = v19.PrepareMask(mask_w = 140, mask_h = 100, mask_tolerance = 150)
#return v19_m
v19 = v19.convertToRGB32(interlaced=false, matrix="PC.709")

v19 = v19.ExInpaint(mask = v19_m)
v19 = v19.convertToYV24(interlaced=false)

va = BlankClip(v19, audio_rate = 48000, channels = 2).killVideo
v19 = v19.audioDub(va)

last = v19
prefetch

