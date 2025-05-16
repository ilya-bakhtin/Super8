import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v117 = LSMASHVideoSource(dst_dir + "v117m.mp4")
v117 = v117.convertToRGB32(interlaced=false)
return v117

