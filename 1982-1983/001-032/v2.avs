import("8mm film 2048x1536 18Fps.mov.avs")
v2 = v2.convertToRGB24(interlaced=false)
return v2.Prefetch(6)

