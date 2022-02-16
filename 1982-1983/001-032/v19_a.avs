import("8mm film 2048x1536 18Fps.mov.avs")
v19 = v19.extractY.autolevels(minRng=0, input_low=0, input_high=70).convertToYV12.unsharpMask().convertToRGB32(interlaced=false)
return v19.Prefetch(6)

