import("..\1989-sevas.avs")
function levels(clip c, int input_low)
{
    return c.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = input_low, input_high = 240, autolevel = false, gamma=0.8)
}
v22 = LSMASHVideoSource(dst_dir + "v22f.mp4").ConvertToYV24()
v22 = v22.autolevels(input_low = 90, output_low = 0, input_high = 240, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
v22_i = v22
b_ex = undefined
v22 = v22.AdjustColor(ou = +26, ov = -22, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v22 = v22.animate(118, 135, "levels", 20, 80)
v22_0 = v22
v22 = v22_i
v22 = v22.AdjustColor(ou = +26, ov = -22, x=v22.width*2/3, y=600, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
mask = BlankClip(length = v22.frameCount, width = v22.width, height = v22.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x y + 1.2 - 0.8 / 256 *", chroma="-128") 
#return mask
v22 = v22_0.mt_merge(v22, mask, luma = true)#.interleave(v22_0)
v22 = v22.adjustSize
v22 = v22.assumeFPS(18)
v22 = v22.add_blank_audio
return v22.prefetch
#adjustframerate
