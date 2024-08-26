import("..\..\common.avs")
import("..\1987-Alexej-armada.avs")
#v23 = LSMASHVideoSource(dst_dir + "v23m.mp4")
v23 = v23.autolevels(filterRadius = 0, minRng = 0, ignore_low = 0.03, ignore_high = 0.03)
v23 = v23.convertToRGB32(interlaced=false)
return v23

