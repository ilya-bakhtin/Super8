import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v109 = LSMASHVideoSource(dst_dir + "v109m.mp4")
v109 = v109.convertToRGB32(interlaced=false)
return v109

