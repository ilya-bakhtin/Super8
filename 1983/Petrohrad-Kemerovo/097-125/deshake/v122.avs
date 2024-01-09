import("..\..\common.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v122 = LSMASHVideoSource(dst_dir + "v122m.mp4")
v122 = v122.convertToRGB32(interlaced=false)
return v122

