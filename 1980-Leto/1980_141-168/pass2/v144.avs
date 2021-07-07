function f1(clip c)
{
    c = c.AdjustColor(ou=2, ov=-6, sat=3, lo_th=0.2, hi_th=0.2, lock_chan=1, red=0.92, blu=0.96, gam_mac=true)
    c = c.Filter(th_SAD=4000, th_SADC=4000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                 truemotion=false, sigma_y=0, sigma_c=6)
    return c
}
function f2(clip c)
{
    c = c.AdjustColor(ou=2, ov=-6, sat=3, lo_th=0.2, hi_th=0.2, lock_chan=0, red=0.92, blu=0.96, gam_mac=true)
    c = c.Filter(th_SAD=4000, th_SADC=4000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                 truemotion=false, sigma_y=0, sigma_c=6)
    return c
}
function f3(clip c)
{
    c = c.Filter(th_SAD=4000, th_SADC=4000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                 truemotion=false, sigma_y=0, sigma_c=0, hpad=16, vpad=16)
#    c = c.tweak(cont = 1.5, coring = false)
#    c = c.AdjustColor(ou=2, ov=-6, sat=3, lo_th=0.2, hi_th=0.2, lock_chan=1, red=0.92, blu=0.96, gam_mac=true)
    return c
}
import("..\11943 Bakhtin N8 02.720p_06.mov.avs")
v144 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_141-168\11943 Bakhtin N8 02.720p_06-144.mov.avi")
v144 = v144.convertToYV12
v144 = v144.Filter_0 #f3
/*
v144 = v144.AdjustColor(ou=2, ov=-6, sat=3, lo_th=0.2, hi_th=0.2, lock_chan=1, red=0.92, blu=0.96, gam_mac=true)
#v144 = v144.ColorYUV(gain_y=128).AdjustColor(2, -6, 0, 3, red_mul=0.92, blu_mul=0.96)
v144 = v144.Filter(th_SAD=4000, th_SADC=4000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=6)
#v144 = v144.AdjustColor(ou=2, ov=-6, sat=3, lo_th=0.2, hi_th=0.2, lock_chan=1, red=0.92, blu=0.96, gam_mac=true)
*/
#return v144.histogram("levels").prefetch(6)
return v144.prefetch(6)
