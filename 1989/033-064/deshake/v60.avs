import("..\..\common.avs")
import("..\1989-Sevas.avs")
v60 = LSMASHVideoSource(dst_dir + "v60m.mp4")
v60 = v60.convertToRGB32(interlaced=false)
return v60

