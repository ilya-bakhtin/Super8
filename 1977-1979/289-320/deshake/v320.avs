import("..\..\common.avs")
import("..\1977-1979.avs")
#v320 = LSMASHVideoSource(dst_dir + "v320m.mp4")
v320 = v320.convertToRGB32(interlaced=false)
return v320

