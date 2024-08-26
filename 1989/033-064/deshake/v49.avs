import("..\..\common.avs")
import("..\1989-Sevas.avs")
v49 = LSMASHVideoSource(dst_dir + "v49m.mp4")
v49 = v49.convertToRGB32(interlaced=false)
return v49

