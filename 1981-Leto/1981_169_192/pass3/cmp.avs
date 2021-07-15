v08 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\11449 Digitalizace\uncompressed\11449 Bakhtin 02 N8.720p_08.mov.avi")
v169 = LWLibavVideoSource("D:\Users\ilx\wrk\video\Super8\1981\1981_169_192\pass3\v169r.avi")
return v08.interleave(v169.convertToYV12)
