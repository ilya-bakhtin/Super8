import("..\1982-skola-2.avs")
v13 = LSMASHVideoSource(dst_dir + "v13f.mp4").extractY.ConvertToYV12()
v13 = v13.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v13 = v13.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v13.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.1).trim(1, 0)
v13 = v13.adjustSize
v13 = v13.assumeFPS(18)
return v13
#adjustframerate
