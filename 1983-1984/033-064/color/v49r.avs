import("..\1983-1984.avs")
v49 = LSMASHVideoSource(dst_dir + "v49f.mp4").ConvertToYV24()
v49 = v49.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
v49 = v49.adjustSize
v49 = v49.assumeFPS(18)
v49 = v49.add_blank_audio
return v49.prefetch
#adjustframerate
