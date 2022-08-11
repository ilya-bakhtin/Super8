import("..\1982-skola-2.avs")
v11 = LSMASHVideoSource(dst_dir + "v11f.mp4").extractY.ConvertToYV12()
v11 = v11.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v11 = v11.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3)
v11 = v11.adjustSize
v11 = v11.assumeFPS(18)
return v11
#adjustframerate
