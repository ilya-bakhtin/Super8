import("..\1982-skola-2.avs")
v24 = LSMASHVideoSource(dst_dir + "v24f.mp4").extractY.ConvertToYV12()
v24 = v24.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v24 = v24.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v24.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=2).trim(1, 0)
v24 = v24.adjustSize
v24 = v24.assumeFPS(18)
return v24
#adjustframerate
