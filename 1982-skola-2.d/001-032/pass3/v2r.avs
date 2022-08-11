import("..\1982-skola-2.avs")
v2 = LSMASHVideoSource(dst_dir + "v2f.mp4").extractY.ConvertToYV12()
v2 = v2.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v2 = v2.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
     v2.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(1, 0)
v2 = v2.adjustSize
v2 = v2.assumeFPS(18)
return v2
#adjustframerate
