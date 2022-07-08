import("..\1982-skola-1-N8-film.mov.avs")
v117 = LWLibavVideoSource(source_dir + "v117f.avi", cache=false).ConvertToYV24()
v117 = v117.AdjustColor(ou=4, ov=-6, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v117 = v117.animate(174, 182, "color_uv", 0, 0, 0, 14).trim(0, 182) +\
       v117.animate(190, 197, "color_uv", 0, 14, 0, 0).trim(183, 197) +\
       v117.animate(219, 229, "color_uv", 0, 0, 0, 14).trim(198, 0)
v117 = v117.adjustSize
v117 = v117.assumeFPS(18)
return v117.prefetch
#adjustframerate
