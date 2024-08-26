import("..\..\common.avs")
import("..\1989-Sevas.avs")
v44 = LSMASHVideoSource(dst_dir + "v44m.mp4")
v44 = v44.convertToRGB32(interlaced=false)
return v44

