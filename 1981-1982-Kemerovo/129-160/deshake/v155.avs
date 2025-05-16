import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v155 = LSMASHVideoSource(dst_dir + "v155m.mp4")
v155 = v155.convertToRGB32(interlaced=false)
return v155

