import("..\1983-Moskva-Tallinn.avs")
v31 = LSMASHVideoSource(dst_dir + "v31f.mp4").ConvertToYV24()
v31 = v31.colorYUV(off_y = -6).trim(0, -1) +\
      v31.colorYUV(off_y = -8).trim(1, 6) +\
      v31.colorYUV(off_y = -10).trim(7, 9) +\
      v31.colorYUV(off_y = -12).trim(10, 12) +\
      v31.colorYUV(off_y = -13).trim(13, 16) +\
      v31.colorYUV(off_y = -10, cont_y = -5).trim(17, 29) +\
      v31.colorYUV(off_y = -12, cont_y = -2).trim(30, 31) +\
      v31.colorYUV(off_y = -13).trim(32, -1) +\
      v31.colorYUV(off_y = -12).trim(33, -1) +\
      v31.colorYUV(off_y = -11).trim(34, 44) +\
      v31.colorYUV(off_y = -8).trim(45, 94) +\
      v31.colorYUV(off_y = -10).trim(95, 96) +\
      v31.colorYUV(off_y = -12).trim(97, 99) +\
      v31.colorYUV(off_y = -14).trim(100, 101) +\
      v31.colorYUV(off_y = -16).trim(102, 136) +\
      v31.colorYUV(off_y = -14).trim(137, 154) +\
      v31.colorYUV(off_y = -12).trim(155, 157) +\
      v31.colorYUV(off_y = -8, cont_y = -4).trim(158, 0)
v31 = v31.AdjustColor(ou = +12, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v31 = v31.adjustSize
v31 = v31.assumeFPS(18)
v31 = v31.add_blank_audio
return v31.prefetch
#adjustframerate
