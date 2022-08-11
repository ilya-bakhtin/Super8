import("..\1982-skola-2.avs")
v15 = LSMASHVideoSource(dst_dir + "v15f.mp4").extractY.ConvertToYV12()
v15 = v15.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v15 = v15.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v15.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=2).trim(1, 0)
v15 = v15.adjustSize
v15 = v15.assumeFPS(18)
return v15
#adjustframerate
