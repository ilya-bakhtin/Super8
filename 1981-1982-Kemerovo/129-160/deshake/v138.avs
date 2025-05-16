import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v138 = LSMASHVideoSource(dst_dir + "v138m.mp4")
v138 = v138.convertToRGB32(interlaced=false)
return v138

