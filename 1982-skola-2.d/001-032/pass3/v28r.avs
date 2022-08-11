import("..\1982-skola-2.avs")
v28 = LSMASHVideoSource(dst_dir + "v28f.mp4").extractY.ConvertToYV12()
v28 = v28.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v28 = v28.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v28.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v28 = v28.adjustSize
v28 = v28.assumeFPS(18)
return v28
#adjustframerate
