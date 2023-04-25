SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("c:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v11 = v11.deScratch(maxwidth=5, mindif=1)

v11_m = v11.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)
#return v11_m
v11 = v11.convertToRGB32(interlaced=false, matrix="PC.709")

v11 = v11.ExInpaint(mask = v11_m)
v11 = v11.convertToYV24(interlaced=false)

va = BlankClip(v11, audio_rate = 48000, channels = 2).killVideo
v11 = v11.audioDub(va)

last = v11
prefetch

