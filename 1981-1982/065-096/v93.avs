import("11943 Bakhtin N8 01.720p_01-65.mov.avs")
v93 = v93.trim(0, -1).autolevels(ignore_low=0.0003, input_high=102, border_l = 50, border_r = 50, border_t = 50, border_b = 50, filterRadius = 9, minRng=0) +\
      v93.trim(1, 0).autolevels(gamma=1.5, ignore_low=0.0003, ignore_high=0.0003, border_l = 50, border_r = 50, border_t = 50, border_b = 50, filterRadius = 9, minRng=0)
return v93.Prefetch(6)

