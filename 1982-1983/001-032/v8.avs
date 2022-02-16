import("8mm film 2048x1536 18Fps.mov.avs")
v8 = v8.convertToRGB24(interlaced=false)
return v8.Prefetch(6)

