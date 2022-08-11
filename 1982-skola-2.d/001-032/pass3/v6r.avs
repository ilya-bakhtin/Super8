import("..\1982-skola-2.avs")
v6 = LSMASHVideoSource(dst_dir + "v6f.mp4").extractY.ConvertToYV12()
v6 = v6.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v6 = v6.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
     v6.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(1, 0)
v6 = v6.adjustSize
v6 = v6.assumeFPS(18)
return v6
#adjustframerate
