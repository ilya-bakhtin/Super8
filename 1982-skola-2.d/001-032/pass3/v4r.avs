import("..\1982-skola-2.avs")
v4 = LSMASHVideoSource(dst_dir + "v4f.mp4").extractY.ConvertToYV12()
v4 = v4.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v4 = v4.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
     v4.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(1, 0)
v4 = v4.adjustSize
v4 = v4.assumeFPS(18)
return v4
#adjustframerate
