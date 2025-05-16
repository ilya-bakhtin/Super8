import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
#v123 = LSMASHVideoSource(dst_dir + "v123m.mp4")
v123 = v123.convertToRGB32(interlaced=false)
return v123

