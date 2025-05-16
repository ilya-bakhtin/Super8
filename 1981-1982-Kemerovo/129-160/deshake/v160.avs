import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v160 = LSMASHVideoSource(dst_dir + "v160m.mp4")
v160 = v160.convertToRGB32(interlaced=false)
return v160

