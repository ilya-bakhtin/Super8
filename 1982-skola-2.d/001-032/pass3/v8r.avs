import("..\1982-skola-2.avs")
v8 = LSMASHVideoSource(dst_dir + "v8f.mp4").extractY.ConvertToYV12()
v8 = v8.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v8 = v8.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
     v8.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(1, 0)
v8 = v8.adjustSize
v8 = v8.assumeFPS(18)
return v8
#adjustframerate
