import("..\..\common.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v115 = LSMASHVideoSource(dst_dir + "v115m.mp4")
v115 = v115.convertToRGB32(interlaced=false)
return v115

