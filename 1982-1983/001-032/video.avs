import("d:\Users\ilx\wrk\video\Super8\1982\001-032\common.avs")

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")
v1 = LWLibavVideoSource("d:\Users\ilx\wrk\video\Super8\1982\001-032\template-copy.vdscript.avi").AssumeFPS(30,1)
last = v1
ConvertToYV12()
