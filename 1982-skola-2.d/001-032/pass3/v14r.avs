import("..\1982-skola-2.avs")
v14 = LSMASHVideoSource(dst_dir + "v14f.mp4").extractY.ConvertToYV12()
v14 = v14.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v14 = v14.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v14.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v14 = v14.adjustSize
v14 = v14.assumeFPS(18)
return v14
#adjustframerate
