import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Moskva-Tallinn.avs")
v28 = LSMASHVideoSource(dst_dir + "v28f.mp4").ConvertToYV24()
v28 = v28.AdjustColor(ou = +8, ov = -4, x=300, y=10, w=-10, h=-200, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.7, gam_mac=true)
v28 = v28.autolevels(filterRadius = 0, minRng=0, ignore_low=0.003, ignore_high=0.003, border_b = 200, gamma=1.7)
v28 = v28.adjustSize
v28 = v28.assumeFPS(18)
v28 = v28.add_blank_audio
return v28.prefetch
#adjustframerate
