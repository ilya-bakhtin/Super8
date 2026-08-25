import("..\..\common.avs")
import("..\1977-1979.avs")
#v365 = LSMASHVideoSource(dst_dir + "v365m.mp4")
v365 = v365.convertToRGB32(interlaced=false)
return v365

