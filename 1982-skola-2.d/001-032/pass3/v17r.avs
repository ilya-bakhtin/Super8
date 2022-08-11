import("..\1982-skola-2.avs")
v17 = LSMASHVideoSource(dst_dir + "v17f.mp4").extractY.ConvertToYV12()
v17 = v17.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v17 = v17.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v17.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v17 = v17.adjustSize
v17 = v17.assumeFPS(18)
return v17
#adjustframerate
