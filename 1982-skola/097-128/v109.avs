SetFilterMTMode("Deshaker", MT_SERIALIZED)

#source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1982-skola\\033-064\\"
source_dir = "d:\Users\ilx\wrk\video\Super8\1982-skola\097-128\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("1982-skola-1-N8-film.mov.avs")
v109 = v109.convertToRGB32(interlaced=false, matrix="PC.709")

v109 = v109 + v109.loop(30, 0, 0).trim(0, 29)

config = "19|2|30|4|1|0|1|0|640|480|0|1|100|100|100|100|4|1|0|2|2|30|300|4|" + source_dir + "v109.log|0|0|0|0|0|0|0|0|0|0|0|0|0|1|15|15|0.0015|0.0015|1|1|30|30|0|0|0|0|1|1|1|10|1000|1|88|1|1|20|5000|100|20|1|0|ff00ff"

v109 = v109.Deshaker(config).trim(30, 0)
v109 = v109.convertToYV12(interlaced=false, matrix="PC.709")

return v109.Prefetch(6)

