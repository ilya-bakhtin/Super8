import("..\1989-Sevas.avs")
function adjColBord(clip c, int x, int w)
{
    return c.AdjustColor(ou = +16, ov = -12, x=x, y=10, w=-w, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true)
}
v11 = LSMASHVideoSource(dst_dir + "v11f.mp4").ConvertToYV24()
b_ex = undefined
v11 = v11.animate(170, 180, "adjColBord", 10, 10, 10, 1000).trim(0, 279) +\
      v11.animate(280, 320, "adjColBord", 10, 1000, 10, 10).trim(280, 0)
v11 = v11.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=0.8)
v11 = v11.adjustSize
v11 = v11.assumeFPS(18)
v11 = v11.add_blank_audio
return v11.prefetch
#adjustframerate
