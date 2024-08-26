import("..\..\common.avs")
import("..\1989-Sevas.avs")
v39 = LSMASHVideoSource(dst_dir + "v39m.mp4")
v39 = v39.convertToRGB32(interlaced=false)
return v39

