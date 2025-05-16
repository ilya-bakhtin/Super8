import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
#v42 = LSMASHVideoSource(dst_dir + "v42m.mp4")
v42 = v42.convertToRGB32(interlaced=false)
return v42

