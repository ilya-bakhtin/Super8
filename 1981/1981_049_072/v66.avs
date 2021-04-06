import("11449 Bakhtin 02 N8.720p_03.mov.avs")
v66 = v66.ConvertBits(16).Filter(th_SAD = 1100, th_SADC=1100).ConvertBits(8)
return v66.Prefetch(6)

