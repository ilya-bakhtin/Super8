import("..\11449 Bakhtin 02 N8.720p_08.mov.avs")
function p3_171(clip c)
{
    c = c.AdjustColor(ou=2, ov=2, lo_th=0.1, hi_th=0.1, x=200, sat=1.5, red = 1, blu = 1, gam_mac=true)
    c = c.convertToYV12
    c = c.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
    c = c.removeDirt
    c = c.UnsharpMask(strength=300, radius=5, threshold=1)
    return c
}
v171 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v171f.avi").ConvertToYV24()
v171_0 = v171.trim(0, 44).p3_171
v171_1 = v171.trim(45, 100).crop(0,0,0,-32).p3_171
v171_2 = v171.trim(101, 114).p3_171
v171_3 = v171.trim(115, 127).crop(0,0,0,-8).p3_171
v171_4 = v171.trim(128, 358).p3_171
v171_5 = v171.trim(359, 384).crop(0,0,0,-16).p3_171
v171_6 = v171.trim(385, 0).p3_171
v171 = v171_0.adjustBorders + v171_1.adjustBorders + v171_2.adjustBorders + v171_3.adjustBorders + v171_4.adjustBorders + v171_5.adjustBorders + v171_6.adjustBorders
#v171 = v171.p3_171
#v171 = v171.AdjustColor(ou=2, ov=2, lo_th=0.1, hi_th=0.1, sat=1.5, red = 1, blu = 1, gam_mac=true)
#v171 = v171.convertToYV12
#v171 = v171.Filter(th_SAD=100, th_SADC=100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                   truemotion=true, sigma_y=0, sigma_c=0)
#v171 = v171.removeDirt
#return v171.histogram("levels").prefetch(6)
return v171.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
