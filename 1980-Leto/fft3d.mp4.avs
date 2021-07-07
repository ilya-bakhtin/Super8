LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")
LSMASHVideoSource("D:\Users\ilx\wrk\video\Super8\Digitalizace 11943\fft3d.mp4").info
#v1 = LSMASHVideoSource("D:\Users\ilx\wrk\video\Super8\Digitalizace 11943\fft3d-.mp4").info
#v1 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-.mov.avi").ConvertToYV12
v1 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01.mov.avi").ConvertToYV12
#return v1.info
return trim(1, 0).stackhorizontal(v1)
return trim(725, 0).stackhorizontal(v1)