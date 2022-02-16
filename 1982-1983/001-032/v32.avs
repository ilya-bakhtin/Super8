import("8mm film 2048x1536 18Fps.mov.avs")
v32 = v32.convertToRGB24(interlaced=false)
return v32.Prefetch(6)

