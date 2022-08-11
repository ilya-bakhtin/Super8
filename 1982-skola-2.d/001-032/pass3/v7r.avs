import("..\1982-skola-2.avs")
v7 = LSMASHVideoSource(dst_dir + "v7f.mp4").extractY.ConvertToYV12()
v7 = v7.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v7 = v7.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.5)
v7 = v7.adjustSize
v7 = v7.assumeFPS(18)
return v7
#adjustframerate
