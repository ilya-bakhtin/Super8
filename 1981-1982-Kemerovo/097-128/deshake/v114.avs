import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v114 = LSMASHVideoSource(dst_dir + "v114m.mp4")
v114 = v114.convertToRGB32(interlaced=false)
return v114

