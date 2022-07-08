import("..\1982-skola-1-N8-film.mov.avs")
v118 = LWLibavVideoSource(source_dir + "v118f.avi", cache=false).ConvertToYV24()
v118 = v118.AdjustColor(ou=4, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v118 = v118.animate(26, 46, "color_uv", 0, 0, 0, 10).trim(0, 46) +\
       v118.animate(100, 110, "color_uv", 0, 10, 0, 0).trim(47, 110) +\
       v118.animate(233, 243, "color_uv", 0, 0, 0, 10).trim(111, 243) +\
       v118.animate(260, 285, "color_uv", 0, 10, 0, 0).trim(244, 0)
v118 = v118.animate(33, 45, "gamma", 1000, 800)
v118 = v118.adjustSize
v118 = v118.assumeFPS(18)
return v118.prefetch
#adjustframerate
