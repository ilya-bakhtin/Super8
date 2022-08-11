import("..\1982-skola-2.avs")
v12 = LSMASHVideoSource(dst_dir + "v12f.mp4").extractY.ConvertToYV12()
v12 = v12.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v12 = v12.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v12.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.1).trim(1, 0)
v12 = v12.adjustSize
v12 = v12.assumeFPS(18)
return v12
#adjustframerate
