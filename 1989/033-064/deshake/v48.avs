import("..\..\common.avs")
import("..\1989-Sevas.avs")
v48 = LSMASHVideoSource(dst_dir + "v48m.mp4")
v48 = v48.convertToRGB32(interlaced=false)
return v48

