import("..\1982-skola-1-N8-film.mov.avs")
v115 = LWLibavVideoSource(source_dir + "v115f.avi", cache=false).ConvertToYV24()
v115 = v115.AdjustColor(ou=4, ov=2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v115 = v115.animate(140, 150, "color_uv", 0, 0, 0, 14).trim(0, 154) +\
       v115.animate(160, 170, "color_uv", 0, 14, 0, 0).trim(155, 0)
v115 = v115.animate(402, 417, "gamma", 700, 400).trim(0, 417) +\
       v115.animate(417, 432, "gamma", 400, 700).trim(418, 0)
v115 = v115.adjustSize
v115 = v115.assumeFPS(18)
return v115.prefetch
#adjustframerate
