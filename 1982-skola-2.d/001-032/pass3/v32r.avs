import("..\1982-skola-2.avs")
v32 = LSMASHVideoSource(dst_dir + "v32f.mp4").extractY.ConvertToYV12()
v32 = v32.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v32 = v32.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v32.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(1, 0)
v32 = v32.adjustSize
v32 = v32.assumeFPS(18)
#return v32.histogram("levels")
return v32
#adjustframerate
