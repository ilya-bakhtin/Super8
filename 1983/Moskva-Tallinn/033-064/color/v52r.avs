import("..\1983-Moskva-Tallinn.avs")
v52 = LSMASHVideoSource(dst_dir + "v52f.mp4").ConvertToYV24()
v52 = v52.AdjustColor(ou = +14, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v52 = v52.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=2).trim(0, -1) +\
      v52.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=2.7).trim(1, -1) +\
      v52.animate(2, 75, "gamma_f", 2.7, 1.0).trim(2, 0)
v52 = v52.adjustSize
v52 = v52.assumeFPS(18)
v52 = v52.add_blank_audio
return v52.prefetch
#adjustframerate
