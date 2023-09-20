import("..\1983-Moskva-Tallinn.avs")
v86 = LSMASHVideoSource(dst_dir + "v86f.mp4").ConvertToYV24()
v86 = v86.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true)
v86 = v86.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)
v86 = v86.adjustSize
v86 = v86.assumeFPS(18)
v86 = v86.add_blank_audio
return v86.prefetch
#adjustframerate
