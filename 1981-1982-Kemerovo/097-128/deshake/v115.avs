import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v115 = LSMASHVideoSource(dst_dir + "v115m.mp4")
v115 = v115.convertToRGB32(interlaced=false)
return v115

