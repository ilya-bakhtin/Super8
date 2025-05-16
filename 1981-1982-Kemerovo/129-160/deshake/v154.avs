import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v154 = LSMASHVideoSource(dst_dir + "v154m.mp4")
v154 = v154.convertToRGB32(interlaced=false)
return v154

