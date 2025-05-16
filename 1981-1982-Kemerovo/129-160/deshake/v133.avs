import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v133 = LSMASHVideoSource(dst_dir + "v133m.mp4")
v133 = v133.convertToRGB32(interlaced=false)
return v133

