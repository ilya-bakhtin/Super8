import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v146 = LSMASHVideoSource(dst_dir + "v146m.mp4")
v146 = v146.convertToRGB32(interlaced=false)
return v146

