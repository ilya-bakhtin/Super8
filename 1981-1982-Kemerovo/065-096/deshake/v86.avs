import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
#v86 = LSMASHVideoSource(dst_dir + "v86m.mp4")
v86 = v86.convertToRGB32(interlaced=false)
return v86

