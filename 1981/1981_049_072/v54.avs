import("11449 Bakhtin 02 N8.720p_03.mov.avs")
v54 = v54.ConvertBits(16).Filter(th_SAD = 1100, th_SADC=1100).ConvertBits(8)
return v54.Prefetch(6)

