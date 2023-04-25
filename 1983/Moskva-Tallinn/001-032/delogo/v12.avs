SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("c:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v12 = v12.deScratch(maxwidth=5, mindif=1)

v12_m = v12.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)
#return v12_m
v12 = v12.convertToRGB32(interlaced=false, matrix="PC.709")

v12 = v12.ExInpaint(mask = v12_m)
v12 = v12.convertToYV24(interlaced=false)

va = BlankClip(v12, audio_rate = 48000, channels = 2).killVideo
v12 = v12.audioDub(va)

last = v12
prefetch

