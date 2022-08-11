import("..\1982-skola-2.avs")
v23 = LSMASHVideoSource(dst_dir + "v23f.mp4").extractY.ConvertToYV12()
v23 = v23.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v23 = v23.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v23.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v23 = v23.adjustSize
v23 = v23.assumeFPS(18)
return v23
#adjustframerate
