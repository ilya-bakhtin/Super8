import("..\..\common.avs")
import("..\1983-Moskva-Tallinn.avs")
v40 = LSMASHVideoSource(dst_dir + "v40m.mp4")
v40 = v40.convertToRGB32(interlaced=false)
return v40

