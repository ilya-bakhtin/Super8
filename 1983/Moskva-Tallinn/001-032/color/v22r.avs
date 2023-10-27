import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Moskva-Tallinn.avs")
v22 = LSMASHVideoSource(dst_dir + "v22f.mp4").ConvertToYV24()
v22 = v22.colorYUV(off_y = -4).trim(0, 5) +\
      v22.colorYUV(off_y = -10).trim(6, 27) +\
      v22.colorYUV(off_y = -6).trim(28, 37) +\
      v22.colorYUV(off_y = -14).trim(38, 0)
v22 = v22.AdjustColor(ou = +14, ov = -10, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v22 = v22.colorYUV(off_u = +6, off_v = -4)
v22 = v22.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.5)
v22 = v22.adjustSize
v22 = v22.assumeFPS(18)
v22 = v22.add_blank_audio
return v22.prefetch
#adjustframerate
