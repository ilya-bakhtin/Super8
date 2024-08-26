import("..\1989-sevas.avs")
function adjColBord(clip c, int w, int h)
{
    return c.AdjustColor(ou = +16, ov = -12, x=10, y=10, w=-w, h=-h, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true)
}
v13 = LSMASHVideoSource(dst_dir + "v13f.mp4").ConvertToYV24()
b_ex = undefined
v13 = v13.animate(200, 220, "adjColBord", 10, 1000, 400, 10)
v13 = v13.adjustSize
v13 = v13.assumeFPS(18)
v13 = v13.add_blank_audio
return v13.prefetch
#adjustframerate
