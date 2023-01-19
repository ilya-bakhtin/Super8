import("..\1983-1984.avs")
v38 = LSMASHVideoSource(dst_dir + "v38f.mp4").ConvertToYV24()
v38 = v38.AdjustColor(ou = -0, ov = +0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
v38 = v38.colorYUV(off_u = -4, off_v = +0)
v38 = v38.adjustSize
v38 = v38.assumeFPS(18)
v38 = v38.add_blank_audio
return v38.prefetch
#adjustframerate
