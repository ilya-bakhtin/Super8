SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v15 = v15.deScratch(maxwidth=5, mindif=1)

v15_m = v15.PrepareMask#(mask_tolerance = 200)

v15 = v15.convertToRGB32(interlaced=false, matrix="PC.709")

v15 = v15.ExInpaint(mask = v15_m)
v15 = v15.convertToYV24(interlaced=false)

va = BlankClip(v15, audio_rate = 48000, channels = 2).killVideo
v15 = v15.audioDub(va)

last = v15
prefetch

