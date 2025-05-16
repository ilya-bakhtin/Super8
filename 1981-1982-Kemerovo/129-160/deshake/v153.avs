import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v153 = LSMASHVideoSource(dst_dir + "v153m.mp4")
v153 = v153.convertToRGB32(interlaced=false)
return v153

