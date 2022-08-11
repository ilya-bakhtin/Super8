import("..\1982-skola-2.avs")
v19 = LSMASHVideoSource(dst_dir + "v19f.mp4").extractY.ConvertToYV12()
v19 = v19.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v19 = v19.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v19.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.5).trim(1, 0)
v19 = v19.adjustSize
v19 = v19.assumeFPS(18)
return v19
#adjustframerate
