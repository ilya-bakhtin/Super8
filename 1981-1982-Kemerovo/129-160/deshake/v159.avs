import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v159 = LSMASHVideoSource(dst_dir + "v159m.mp4")
v159 = v159.convertToRGB32(interlaced=false)
return v159

