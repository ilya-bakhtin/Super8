import("11943 Bakhtin N8 01.720p_01-97.mov.avs")
v97 = v97.trim(0, -1).autolevels(ignore_low=0.0003, ignore_high=0.006, border_l = 10, border_r = 10, border_t = 50, border_b = 50, filterRadius = 3, minRng=0) +\
      v97.trim(1, 0).autolevels(ignore_low=0.0003, ignore_high=0.006, border_l = 10, border_r = 10, border_t = 50, border_b = 50, filterRadius = 3, minRng=0)
return v97.Prefetch(6)

