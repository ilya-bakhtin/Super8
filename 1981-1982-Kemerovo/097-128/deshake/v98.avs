import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v98 = LSMASHVideoSource(dst_dir + "v98m.mp4")
v98 = v98.convertToRGB32(interlaced=false)
return v98

