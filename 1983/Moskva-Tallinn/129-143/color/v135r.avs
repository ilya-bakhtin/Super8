import("..\1983-Moskva-Tallinn.avs")
v135 = LSMASHVideoSource(dst_dir + "v135f.mp4").ConvertToYV24()
b_ex = undefined
v135 = v135.AdjustColor(ou = +12, ov = -4, x=200, y=200, w=-100, h=-100, lo_th=0.04, hi_th=0.4, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v135 = v135.colorYUV(off_u = +10, off_v = -10)
v135 = v135.adjustSize
v135 = v135.assumeFPS(18)
v135 = v135.add_blank_audio
return v135.prefetch
#adjustframerate
