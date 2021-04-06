import("11449 Bakhtin 02 N8.720p_03.mov.avs")
v53 = v53.ConvertBits(16).Filter(th_SAD = 400, th_SADC=400).ConvertBits(8)
return v53.Prefetch(6)

