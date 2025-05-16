import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v149 = LSMASHVideoSource(dst_dir + "v149m.mp4")
v149 = v149.convertToRGB32(interlaced=false)
return v149

