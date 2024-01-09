import("..\..\common.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v117 = LSMASHVideoSource(dst_dir + "v117m.mp4")
v117 = v117.convertToRGB32(interlaced=false)
return v117

