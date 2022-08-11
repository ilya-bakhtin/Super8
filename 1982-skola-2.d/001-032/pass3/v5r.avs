import("..\1982-skola-2.avs")
v5 = LSMASHVideoSource(dst_dir + "v5f.mp4").extractY.ConvertToYV12()
v5 = v5.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v5 = v5.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
     v5.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.5).trim(1, 0)
v5 = v5.adjustSize
v5 = v5.assumeFPS(18)
return v5
#adjustframerate
