SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "d:\\Users\\ilx\\wrk\\video\\Super8\\1982-skola-2.d\\001-032\\"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("1982-skola-2.avs")
#return v1.convertToYV12.interleave(v1.extractY.convertToYV12.deScratch(maxwidth=15, mindif=1)).prefetch
return v1.convertToYV12.interleave(v1.extractY.convertToYV12.deSpot(pwidth=900, pheight=900, p2=30, mthres=20, p1=15, sign=1)).prefetch
v1 = v1.convertToRGB32(interlaced=false, matrix="PC.709")

v1 = v1 + v1.loop(30, 0, 0).trim(0, 29)

config = "19|2|30|4|1|0|1|0|640|480|0|1|100|100|100|100|4|1|0|2|2|30|300|4|" + source_dir + "v1.log|0|0|0|0|0|0|0|0|0|0|0|0|0|1|15|15|0.0015|0.0015|1|1|30|30|0|0|0|0|1|1|1|10|1000|1|88|1|1|20|5000|100|20|1|0|ff00ff"

v1 = v1.Deshaker(config).trim(30, 0)

v1 = v1.convertToYV12(interlaced=false, matrix="PC.709")

return v1

