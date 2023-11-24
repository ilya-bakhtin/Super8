import("..\..\common.avs")
import("..\1983-Moskva-Tallinn.avs")
v64 = LSMASHVideoSource(dst_dir + "v64m.mp4")
v64 = v64.convertToRGB32(interlaced=false)
return v64

