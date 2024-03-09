import("..\..\common.avs")
import("..\1989-Sevas.avs")
v28 = LSMASHVideoSource(dst_dir + "v28m.mp4")
v28 = v28.convertToRGB32(interlaced=false)
return v28

