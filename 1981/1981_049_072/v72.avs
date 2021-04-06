import("11449 Bakhtin 02 N8.720p_03.mov.avs")
v72 = v72.ConvertBits(16).Filter(th_SAD = 600, th_SADC=600).ConvertBits(8)
return v72.Prefetch(6)

