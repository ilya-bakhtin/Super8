import("..\11449 Bakhtin 02 N8.720p_08.mov.avs")
function p3_170(clip c)
{
    c = c.AdjustColor(ou=8, ov=-4, lo_th=0.1, hi_th=0.1, sat=2, blu = 0.9, gam_mac=true)
    c = c.convertToYV12
    c = c.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
    c = c.removeDirt
    c = c.UnsharpMask(strength=300, radius=5, threshold=1)
    return c
}
v170 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v170f.avi").ConvertToYV24()
v170_0 = v170.trim(0, 45).crop(0,0,-18,-32)
v170_0 = v170_0.p3_170
v170_1 = v170.trim(46, 64).crop(0,0,-4,-28)
v170_1 = v170_1.p3_170
v170_2 = v170.trim(65, 0).crop(0,0,-12,-16)
v170_2 = v170_2.p3_170
v170 = v170_0.adjustBorders + v170_1.adjustBorders + v170_2.adjustBorders
#v170 = v170.AdjustColor(ou=8, ov=-4, lo_th=0.1, hi_th=0.1, sat=2, blu = 0.9, gam_mac=true)
#v170 = v170.convertToYV12
#v170 = v170.Filter(th_SAD=100, th_SADC=100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                   truemotion=true, sigma_y=0, sigma_c=0)
#v170 = v170.removeDirt
#return v170.histogram("levels").prefetch(6)
return v170.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
