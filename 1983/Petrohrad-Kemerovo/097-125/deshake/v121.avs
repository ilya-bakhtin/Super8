import("..\..\common.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v121 = LSMASHVideoSource(dst_dir + "v121m.mp4")
v121 = v121.convertToRGB32(interlaced=false)
return v121

