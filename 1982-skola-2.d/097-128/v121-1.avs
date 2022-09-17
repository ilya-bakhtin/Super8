SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1982-skola-2.d\\097-128\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("1982-skola-2.avs")

v121 = v121.extractY.convertToYV12.deScratch(maxwidth=5, mindif=1)

v121 = v121.convertToRGB32(interlaced=false, matrix="PC.709")

v121 = v121 + v121.loop(30, 0, 0).trim(0, 29)

config = "19|2|30|4|1|0|1|0|640|480|0|1|100|100|100|100|4|1|0|2|2|30|300|4|" + source_dir + "v121.log|0|0|0|0|0|0|0|0|0|0|0|0|0|1|15|15|0.0015|0.0015|1|1|30|30|0|0|0|0|1|1|1|10|1000|1|88|1|1|20|5000|100|20|1|0|ff00ff"

v121 = v121.Deshaker(config).trim(30, 0)

va = BlankClip(v121, audio_rate = 48000, channels = 2).killVideo
v121 = v121.audioDub(va)

v121 = v121.convertToYV12(interlaced=false, matrix="PC.709")

return v121

