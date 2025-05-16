import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v143 = LSMASHVideoSource(dst_dir + "v143m.mp4")
v143 = v143.convertToRGB32(interlaced=false)
return v143

