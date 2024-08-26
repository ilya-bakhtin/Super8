import("..\1989-Sevas.avs")
function gamma_a(clip c, float gamma)
{
    return c.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=gamma)
}
v92 = LSMASHVideoSource(dst_dir + "v92f.mp4").ConvertToYV24()
v92_i = v92
#v92 = v92.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 200
#v92 = v92.trim(399, -1).loop(v92.frameCount).crop(0, 0, 0, add_height - v92.height).stackVertical(v92)
#return v92.histogram.prefetch
v92 = v92.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v92 = v92.colorYUV(off_u = -4, off_v = +4)
v92 = v92.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
#return v92.hist_levels.prefetch
#v92 = v92.animate(200, 220, "gamma_a", 0.3, 0.6)
#v92 = v92.crop(0, add_height, 0, 0)
#v92 = v92.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 255, autolevel = false)
###
v92_0 = v92
v92 = v92_i
add_height = 100
v92 = v92.stackVertical(v92.trim(100, -1).loop(v92.frameCount).crop(0, v92.height - add_height, 0, 0))
v92 = v92.AdjustColor(ou = +14, ov = -8, x=v92.width*3/4, y=v92.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v92 = v92.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5, border_l=v92.width*3/4, border_t=v92.height*2/3)
v92 = v92.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v92.frameCount, width = v92.width, height = v92.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v92 = v92_0.mt_merge(v92, mask, luma = true)
#return v92_0.interleave(v92).prefetch
###
v92 = v92.adjustSize
v92 = v92.assumeFPS(18)
v92 = v92.add_blank_audio
return v92.prefetch
#adjustframerate
