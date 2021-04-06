import("11449 Bakhtin 02 N8.720p_03.mov.avs")
v64 = v64.ConvertBits(16).Filter(th_SAD = 600, th_SADC=600).ConvertBits(8)
return v64.Prefetch(6)

