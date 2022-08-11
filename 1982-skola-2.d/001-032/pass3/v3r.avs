import("..\1982-skola-2.avs")
v3 = LSMASHVideoSource(dst_dir + "v3f.mp4").extractY.ConvertToYV12()
v3 = v3.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v3 = v3.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
     v3.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(1, 0)
v3 = v3.adjustSize
v3 = v3.assumeFPS(18)
return v3
#adjustframerate
