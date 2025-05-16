import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
#v1 = LSMASHVideoSource(dst_dir + "v1m.mp4")
#v1 = v1.autolevels(gamma = 3, ignore_low = 0.3, ignore_high = 0.3, minRng = 0, filterRadius = 0)
v1 = v1.convertToRGB32(interlaced=false)
return v1

