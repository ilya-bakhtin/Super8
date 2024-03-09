import("..\..\common.avs")
import("..\1989-Sevas.avs")
v30 = LSMASHVideoSource(dst_dir + "v30m.mp4")
v30 = v30.convertToRGB32(interlaced=false)
return v30

