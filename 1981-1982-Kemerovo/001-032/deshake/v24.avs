import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
#v24 = LSMASHVideoSource(dst_dir + "v24m.mp4")
v24 = v24.convertToRGB32(interlaced=false)
return v24

