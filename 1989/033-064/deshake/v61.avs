import("..\..\common.avs")
import("..\1989-Sevas.avs")
v61 = LSMASHVideoSource(dst_dir + "v61m.mp4")
v61 = v61.convertToRGB32(interlaced=false)
return v61

