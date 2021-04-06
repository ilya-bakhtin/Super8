import("11449 Bakhtin 02 N8.720p_03.mov.avs")
v69 = v69.ConvertBits(16).Filter(th_SAD = 1100, th_SADC=1100).ConvertBits(8)
return v69.Prefetch(6)

