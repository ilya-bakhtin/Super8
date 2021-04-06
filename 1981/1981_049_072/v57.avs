import("11449 Bakhtin 02 N8.720p_03.mov.avs")
v57 = v57.ConvertBits(16).Filter(th_SAD = 900, th_SADC=900).ConvertBits(8)
return v57.Prefetch(6)

