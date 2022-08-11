import("..\1982-skola-2.avs")
v10 = LSMASHVideoSource(dst_dir + "v10f.mp4").extractY.ConvertToYV12()
v10 = v10.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v10 = v10.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v10.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=2).trim(1, 0)
v10 = v10.adjustSize
v10 = v10.assumeFPS(18)
return v10
#adjustframerate
