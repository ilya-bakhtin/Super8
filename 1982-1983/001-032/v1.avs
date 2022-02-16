import("8mm film 2048x1536 18Fps.mov.avs")
v1 = v1.convertToRGB24(interlaced=false)
return v1.Prefetch(6)

