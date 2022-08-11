import("..\1982-skola-2.avs")
v16 = LSMASHVideoSource(dst_dir + "v16f.mp4").extractY.ConvertToYV12()
v16 = v16.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v16 = v16.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v16.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v16 = v16.adjustSize
v16 = v16.assumeFPS(18)
return v16
#adjustframerate
