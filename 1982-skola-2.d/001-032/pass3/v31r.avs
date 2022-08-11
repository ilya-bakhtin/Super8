import("..\1982-skola-2.avs")
v31 = LSMASHVideoSource(dst_dir + "v31f.mp4").extractY.ConvertToYV12()
v31 = v31.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v31 = v31.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v31.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v31 = v31.adjustSize
v31 = v31.assumeFPS(18)
return v31
#adjustframerate
