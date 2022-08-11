import("..\1982-skola-2.avs")
v22 = LSMASHVideoSource(dst_dir + "v22f.mp4").extractY.ConvertToYV12()
v22 = v22.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v22 = v22.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v22.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v22 = v22.adjustSize
v22 = v22.assumeFPS(18)
return v22
#adjustframerate
