v1 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v97f.avi").ConvertToYV24()
v2 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v97f-.avi").ConvertToYV24()
return v1.interleave(v2)
