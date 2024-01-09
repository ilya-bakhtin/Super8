import("..\..\common.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v116 = LSMASHVideoSource(dst_dir + "v116m.mp4")
v116 = v116.convertToRGB32(interlaced=false)
return v116

