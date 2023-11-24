import("..\..\common.avs")
import("..\1983-Moskva-Tallinn.avs")
v40 = LSMASHVideoSource(dst_dir + "v40f.mp4").ConvertToYV24()
v40 = v40.AdjustColor(ou = +16, ov = -10, x=10, y=10, w=-10, h=-100, lo_th=0.04, hi_th=0.004, lock_chan=2, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v40 = v40.animate(55, 80, "color_yuv", 0, 0, -4, -4).trim(0, 114) +\
      v40.animate(115, 125, "color_yuv", -4, -4, 0, 0).trim(115, 0)
v40 = v40.autolevels(filterRadius = 0, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=2)
v40 = v40.adjustSize
v40 = v40.assumeFPS(18)
v40 = v40.add_blank_audio
return v40.prefetch
#adjustframerate
