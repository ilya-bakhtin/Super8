import("11449 Bakhtin 02 N8.720p_03.mov.avs")
v50 = v50.ConvertBits(16).Filter(th_SAD = 400, th_SADC=400).ConvertBits(8)
return v50.Prefetch(6)

