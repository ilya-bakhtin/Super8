import("..\..\common.avs")
import("..\1989-Sevas.avs")
v57 = LSMASHVideoSource(dst_dir + "v57m.mp4")
v57 = v57.convertToRGB32(interlaced=false)
return v57

