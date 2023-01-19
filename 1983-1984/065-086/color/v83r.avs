import("..\1983-1984.avs")
v83 = LSMASHVideoSource(dst_dir + "v83f.mp4").ConvertToYV24()
v83 = v83.AdjustColor(ou = +10, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=1.7, gam_mac=true)
v83 = v83.adjustSize
v83 = v83.assumeFPS(18)
v83 = v83.add_blank_audio
return v83.prefetch
#adjustframerate
