import("..\..\common.avs")
import("..\1989-Sevas.avs")
v35 = LSMASHVideoSource(dst_dir + "v35m.mp4")
v35 = v35.convertToRGB32(interlaced=false)
return v35

