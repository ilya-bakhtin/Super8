import("..\1983_720_067.avs")
$$$clip$$$ = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\$$$clip$$$.avi")
$$$clip$$$ = $$$clip$$$.convertToYV12
$$$clip$$$ = $$$clip$$$.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
$$$clip$$$ = $$$clip$$$.convertToYV12
return $$$clip$$$.prefetch(6)
