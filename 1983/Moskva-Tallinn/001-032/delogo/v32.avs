SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1983\\Moskva-Tallinn\\001-032\\delogo\\"

LoadVirtualdubPlugin("d:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-Moskva-Tallinn.avs")

#v32 = v32.deScratch(maxwidth=5, mindif=1)

v32_m = v32.PrepareMask(mask_w = 128, mask_h = 80)
#return v32_m

v32 = v32.convertToRGB32(interlaced=false, matrix="PC.709")

v32 = v32.ExInpaint(mask = v32_m)
v32 = v32.convertToYV24(interlaced=false)

va = BlankClip(v32, audio_rate = 48000, channels = 2).killVideo
v32 = v32.audioDub(va)

last = v32
prefetch

