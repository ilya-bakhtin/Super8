SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "c:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("C:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v25 = v25.deScratch(maxwidth=5, mindif=1)

v25_m = v25.PrepareMask#(mask_tolerance = 200)

v25 = v25.convertToRGB32(interlaced=false, matrix="PC.709")

v25 = v25.ExInpaint(mask = v25_m)
v25 = v25.convertToYV24(interlaced=false)

va = BlankClip(v25, audio_rate = 48000, channels = 2).killVideo
v25 = v25.audioDub(va)

last = v25
prefetch

