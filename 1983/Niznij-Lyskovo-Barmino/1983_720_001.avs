LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("D:\Users\ilx\wrk\video\Super8\1983\8mm film 1.1080p.mov")
assumefps(18)

trim(1, 21373)

crop(240, 0, -240, 0)

Spline64resize(960, 720)

# 59, 291, 389, 484, 668, 777, 985, 1139, 1189, 1236, 1538, 1781
