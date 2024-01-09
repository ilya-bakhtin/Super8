import("..\..\common.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v97 = LSMASHVideoSource(dst_dir + "v97m.mp4")
v97 = v97.convertToRGB32(interlaced=false)
return v97

