import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v118 = LSMASHVideoSource(dst_dir + "v118m.mp4")
v118 = v118.convertToRGB32(interlaced=false)
return v118

