import("..\..\common.avs")
import("..\1989-Sevas.avs")
v59 = LSMASHVideoSource(dst_dir + "v59m.mp4")
v59 = v59.convertToRGB32(interlaced=false)
return v59

