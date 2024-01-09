import("..\..\common.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v124 = LSMASHVideoSource(dst_dir + "v124m.mp4")
v124 = v124.convertToRGB32(interlaced=false)
return v124

