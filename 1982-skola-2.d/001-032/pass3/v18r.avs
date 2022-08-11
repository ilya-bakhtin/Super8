import("..\1982-skola-2.avs")
v18 = LSMASHVideoSource(dst_dir + "v18f.mp4").extractY.ConvertToYV12()
v18 = v18.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v18 = v18.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v18.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.5).trim(1, 0)
v18 = v18.adjustSize
v18 = v18.assumeFPS(18)
return v18
#adjustframerate
