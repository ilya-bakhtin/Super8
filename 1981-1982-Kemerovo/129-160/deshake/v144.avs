import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v144 = LSMASHVideoSource(dst_dir + "v144m.mp4")
v144 = v144.convertToRGB32(interlaced=false)
return v144

