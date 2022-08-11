import("..\1982-skola-2.avs")
v20 = LSMASHVideoSource(dst_dir + "v20f.mp4").extractY.ConvertToYV12()
v20 = v20.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v20 = v20.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(0, -1) +\
      v20.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=2).trim(1, 0)
v20 = v20.adjustSize
v20 = v20.assumeFPS(18)
return v20
#adjustframerate
