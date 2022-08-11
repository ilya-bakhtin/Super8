import("..\1982-skola-2.avs")
v25 = LSMASHVideoSource(dst_dir + "v25f.mp4").extractY.ConvertToYV12()
v25 = v25.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v25 = v25.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v25.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v25 = v25.adjustSize
v25 = v25.assumeFPS(18)
return v25
#adjustframerate
