import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
#v127 = LSMASHVideoSource(dst_dir + "v127m.mp4")
v127 = v127.convertToRGB32(interlaced=false)
return v127

