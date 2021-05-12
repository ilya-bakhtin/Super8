LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#v00 = LSMASHVideoSource("D:\Users\ilx\wrk\video\Super8\Digitalizace 11943\1980\1980-niznij.mp4")
#v01 = LSMASHVideoSource("D:\Users\ilx\wrk\video\Super8\Digitalizace 11943\1980\1980-niznij-v2.mp4")

v1 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\49-52.avi").trim(112, 0)
v2 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\53-56.avi")
v3 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\57-60.avi")
v4 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\61-64.avi")
v5 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\65-68.avi")
v6 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\69-72.avi")
v7 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\73-76.avi")
v8 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\77-80.avi")
v9 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\81-84.avi")
v10 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\85-88.avi")

#v11 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\89-92.avi")
v11_1 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\085-112\v89r.avi")
v11_2 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\085-112\v90r.avi")
v11_3 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\085-112\v91r.avi")
v11_4 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\085-112\v92r.avi")
v11 = v11_1 + v11_2 + v11_3 + v11_4

v12 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\93-96.avi")
v13 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\97-100.avi")
v14 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\101-104.avi")
v15 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\105-108.avi")
v16 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\109-112.avi")

#v17 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\113-116.avi")
v17_1 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v113r.avi")
v17_2 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v114r.avi")
v17_3 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v115r.avi")
v17_4 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v116r.avi")
v17 = v17_1 + v17_2 + v17_3 + v17_4

#v18 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\117-120.avi")
v18_1 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v117r.avi")
v18_2 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v118r.avi")
v18_3 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v119r.avi")
v18_4 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v120r.avi")
v18 = v18_1 + v18_2 + v18_3 + v18_4

#v19 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\121-124.avi")
v19_1 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v121r.avi")
v19_2 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v122r.avi")
v19_3 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v123r.avi")
v19_4 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v124r.avi")
v19 = v19_1 + v19_2 + v19_3 + v19_4

#v20 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\125-128.avi")
v20_1 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v125r.avi")
v20_2 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v126r.avi")
v20_3 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v127r.avi")
v20_4 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v128r.avi")
v20 = v20_1 + v20_2 + v20_3 + v20_4

#v21 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\129-132.avi")
v21_1 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v129r.avi")
v21_2 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v130r.avi")
v21_3 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v131r.avi")
v21_4 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v132r.avi")
v21 = v21_1 + v21_2 + v21_3 + v21_4

#v22 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\133-136.avi")
v22_1 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v133r.avi")
v22_2 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v134r.avi")
v22_3 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v135r.avi")
v22_4 = LWLibavVideoSource("F:\Media\Video\Super8\Sources\Digitalizace 11943\new\113-140\v136r.avi")
v22 = v22_1 + v22_2 + v22_3 + v22_4

v23 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\137-140.avi")
v24 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\141-144.avi")
v25 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980\145-149.avi")

res = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24+v25

#res = v01.stackhorizontal(v00)

return res
