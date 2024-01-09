import("..\..\common.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v120 = LSMASHVideoSource(dst_dir + "v120m.mp4")
v120 = v120.convertToRGB32(interlaced=false)
return v120

