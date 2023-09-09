import("..\1983-Moskva-Tallinn.avs")
v46 = LSMASHVideoSource(dst_dir + "v46f.mp4").ConvertToYV24()
v46 = v46.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-8, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true)
v46 = v46.adjustSize
v46 = v46.assumeFPS(18)
v46 = v46.add_blank_audio
return v46.prefetch
#adjustframerate
