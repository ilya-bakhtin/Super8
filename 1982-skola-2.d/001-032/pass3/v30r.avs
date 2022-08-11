import("..\1982-skola-2.avs")
v30 = LSMASHVideoSource(dst_dir + "v30f.mp4").extractY.ConvertToYV12()
v30 = v30.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v30 = v30.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v30.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v30 = v30.adjustSize
v30 = v30.assumeFPS(18)
return v30
#adjustframerate
