import("..\..\common.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v110 = LSMASHVideoSource(dst_dir + "v110m.mp4")
v110 = v110.convertToRGB32(interlaced=false)
return v110

