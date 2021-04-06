import("11449 Bakhtin 02 N8.720p_03.mov.avs")
v56 = v56.ConvertBits(16).Filter(th_SAD = 900, th_SADC=900).ConvertBits(8)
return v56.Prefetch(6)

