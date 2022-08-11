import("..\1982-skola-2.avs")
v21 = LSMASHVideoSource(dst_dir + "v21f.mp4").extractY.ConvertToYV12()
v21 = v21.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v21 = v21.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v21.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v21 = v21.adjustSize
v21 = v21.assumeFPS(18)
return v21
#adjustframerate
