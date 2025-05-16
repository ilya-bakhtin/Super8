import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
#v93 = LSMASHVideoSource(dst_dir + "v93m.mp4")
v93 = v93.convertToRGB32(interlaced=false)
return v93

