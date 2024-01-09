import("..\..\common.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v99 = LSMASHVideoSource(dst_dir + "v99m.mp4")
v99 = v99.convertToRGB32(interlaced=false)
return v99

