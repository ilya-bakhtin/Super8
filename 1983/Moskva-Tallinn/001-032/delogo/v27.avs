SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v27 = v27.deScratch(maxwidth=5, mindif=1)

v27_m = v27.PrepareMask(mask_w = 140, mask_h = 100, mask_tolerance = 120)
#return v27_m
v27 = v27.convertToRGB32(interlaced=false, matrix="PC.709")

v27 = v27.ExInpaint(mask = v27_m)
v27 = v27.convertToYV24(interlaced=false)

va = BlankClip(v27, audio_rate = 48000, channels = 2).killVideo
v27 = v27.audioDub(va)

last = v27
prefetch

