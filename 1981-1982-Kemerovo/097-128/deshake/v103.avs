import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v103 = LSMASHVideoSource(dst_dir + "v103m.mp4")
v103 = v103.convertToRGB32(interlaced=false)
return v103

