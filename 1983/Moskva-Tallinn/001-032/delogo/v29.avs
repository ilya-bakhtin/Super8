SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v29 = v29.deScratch(maxwidth=5, mindif=1)

v29_m = v29.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)
#return v29_m
v29 = v29.convertToRGB32(interlaced=false, matrix="PC.709")

v29 = v29.ExInpaint(mask = v29_m)
v29 = v29.convertToYV24(interlaced=false)

va = BlankClip(v29, audio_rate = 48000, channels = 2).killVideo
v29 = v29.audioDub(va)

last = v29
prefetch

