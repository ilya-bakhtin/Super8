import("..\..\common.avs")
import("..\1989-Sevas.avs")
v51 = LSMASHVideoSource(dst_dir + "v51m.mp4")
v51 = v51.convertToRGB32(interlaced=false)
return v51

