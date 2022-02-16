SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1982\\033-064\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("8mm film 2048x1536 18Fps.mov.avs")
v62 = v62.convertToRGB32(interlaced=false, matrix="PC.709")

v62 = v62 + v62.loop(30, 0, 0).trim(0, 29)

config = "19|2|30|4|1|0|1|0|640|480|0|1|100|100|100|100|4|1|0|2|2|30|300|4|" + source_dir + "v62.log|0|0|0|0|0|0|0|0|0|0|0|0|0|1|15|15|0.0015|0.0015|1|1|30|30|0|0|0|0|1|1|1|10|1000|1|88|1|1|20|5000|100|20|1|0|ff00ff"

v62 = v62.Deshaker(config).trim(30, 0)
v62 = v62.convertToYV12(interlaced=false, matrix="PC.709")

return v62.Prefetch(6)

