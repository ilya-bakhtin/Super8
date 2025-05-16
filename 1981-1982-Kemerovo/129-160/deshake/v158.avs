import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v158 = LSMASHVideoSource(dst_dir + "v158m.mp4")
v158 = v158.convertToRGB32(interlaced=false)
return v158

