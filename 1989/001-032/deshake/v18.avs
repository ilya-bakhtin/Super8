import("..\..\common.avs")
import("..\1989-Sevas.avs")
v18 = LSMASHVideoSource(dst_dir + "v18m.mp4")
v18 = v18.convertToRGB32(interlaced=false)
return v18

