import("..\..\common.avs")
import("..\1983-Moskva-Tallinn.avs")
v46 = LSMASHVideoSource(dst_dir + "v46m.mp4")
v46 = v46.convertToRGB32(interlaced=false)
return v46

