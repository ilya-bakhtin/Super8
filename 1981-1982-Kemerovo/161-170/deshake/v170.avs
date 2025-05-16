import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
#v170 = LSMASHVideoSource(dst_dir + "v170m.mp4")
v170 = v170.convertToRGB32(interlaced=false)
return v170

