import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v102 = LSMASHVideoSource(dst_dir + "v102m.mp4")
v102 = v102.convertToRGB32(interlaced=false)
return v102

