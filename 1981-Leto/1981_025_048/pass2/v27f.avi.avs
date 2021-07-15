LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")
v0 = LWLibavVideoSource("D:\Users\ilx\wrk\video\Super8\1981\1981_025_048\v27.avi").convertToYV12
v1 = LWLibavVideoSource("D:\Users\ilx\wrk\video\Super8\1981\1981_025_048\pass2\v27f.avi")
return v0.interleave(v1)