import("..\1982-skola-1-N8-film.mov.avs")
v34 = LWLibavVideoSource(source_dir + "v34f.avi", cache=false).ConvertToYV24()
br = v34.trim(250, 250).loop(v34.frameCount).crop(700, 0, -650, 0)
v34 = v34.stackHorizontal(br)
v34 = v34.AdjustColor(ou=2, ov=-2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v34 = v34.crop(0, 0, -br.width, 0)
v34 = v34.colorYUV(off_u=-4, off_v=2)
v34 = v34.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1)
v34 = v34.adjustSize
v34 = v34.assumeFPS(18)
return v34.prefetch
#adjustframerate
