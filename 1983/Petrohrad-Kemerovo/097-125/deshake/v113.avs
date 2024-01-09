import("..\..\common.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v113 = LSMASHVideoSource(dst_dir + "v113m.mp4")
v113 = v113.convertToRGB32(interlaced=false)
return v113

