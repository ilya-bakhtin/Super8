import("..\1982-skola-2.avs")
v1 = LSMASHVideoSource(dst_dir + "v1f.mp4").extractY.ConvertToYV12()
v1 = v1.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v1 = v1.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
     v1.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(1, 0)
v1 = v1.adjustSize
v1 = v1.assumeFPS(18)
return v1
#adjustframerate
