import("..\1983_720_133.avs")
$$$clip$$$ = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\$$$clip$$$.avi")
$$$clip$$$ = $$$clip$$$.AdjustColor(ou=20, ov=-17, lo_th=0.1, hi_th=0.1, lock_chan=0, x=720, red=0.96, blu=0.96, sat=2, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
$$$clip$$$ = $$$clip$$$.convertToYV12
$$$clip$$$ = $$$clip$$$.Filter(th_SAD=500, th_SADC=500, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
$$$clip$$$ = $$$clip$$$.removeDirt
#return $$$clip$$$.histogram("levels").prefetch(6)
return $$$clip$$$.assumeFPS(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
