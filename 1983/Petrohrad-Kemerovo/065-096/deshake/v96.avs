import("..\..\common.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

#v96 = LSMASHVideoSource(dst_dir + "v96m.mp4")
v96 = v96.convertToRGB32(interlaced=false)
return v96

