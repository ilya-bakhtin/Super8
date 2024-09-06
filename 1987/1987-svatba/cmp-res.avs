v1 = LSMASHVideoSource("\\seiki5\m\Media\Video\1- готовые_фильмы\1977-1990\1987-Zima-Podzim\svatba.avi.mp4")
v2_1 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v1r.mp4").assumeFPS(18)
v2_1 = v2_1.trim(1, v2_1.frameCount - 2)
#v2_1 = v2_1.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v2_2 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v2r.mp4").assumeFPS(18)
v2_2 = v2_2.trim(1, 0)#v2_2.frameCount - 2)
v2_3 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v3r.mp4").assumeFPS(18)
v2_3 = v2_3.trim(1, v2_3.frameCount - 3)
v2_4 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v4r.mp4").assumeFPS(18)
v2_4 = v2_4.trim(0, v2_4.frameCount - 2)
v2_5 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v5r.mp4").assumeFPS(18)
v2_5 = v2_5.trim(1, 0)#v2_5.frameCount - 2)
v2_6 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v6r.mp4").assumeFPS(18)
v2_6 = v2_6.trim(1, v2_6.frameCount - 2)
v2_7 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v7r.mp4").assumeFPS(18)
v2_7 = v2_7.trim(0, v2_7.frameCount - 2)
v2_8 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v8r.mp4").assumeFPS(18)
v2_8 = v2_8.trim(1, 0)#v2_8.frameCount - 2)
v2_9 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v9r.mp4").assumeFPS(18)
v2_9 = v2_9.trim(1, 0)#v2_9.frameCount - 2)
v2_10 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v10r.mp4").assumeFPS(18)
v2_10 = v2_10.trim(0, v2_10.frameCount - 2)
/*
v2_11 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v11r.mp4").assumeFPS(18)
v2_11 = v2_11.trim(1, v2_11.frameCount - 2)
*/
v2_12 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v12r.mp4").assumeFPS(18)
v2_12 = v2_12.trim(1, 0)#v2_12.frameCount - 2)
v2_13 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v13r.mp4").assumeFPS(18)
v2_13 = v2_13.trim(1, v2_13.frameCount - 2)
v2_14 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v14r.mp4").assumeFPS(18)
v2_14 = v2_14.trim(1, v2_14.frameCount - 2)
v2_15 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v15r.mp4").assumeFPS(18)
v2_15 = v2_15.trim(0, v2_15.frameCount - 3)
v2_16 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v16r.mp4").assumeFPS(18)
v2_16 = v2_16.trim(0, v2_16.frameCount - 2)
v2_17 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v17r.mp4").assumeFPS(18)
v2_17 = v2_17.trim(1, v2_17.frameCount - 1)
v2_18 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v18r.mp4").assumeFPS(18)
v2_18 = v2_18.trim(1, v2_18.frameCount - 2)
v2_19 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v19r.mp4").assumeFPS(18)
v2_19 = v2_19.trim(1, v2_19.frameCount - 1)
v2_20 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v20r.mp4").assumeFPS(18)
v2_20 = v2_20.trim(1, v2_20.frameCount - 2)
v2_21 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v21r.mp4").assumeFPS(18).convertToYV12
v2_21 = v2_21.trim(1, v2_21.frameCount - 1)
v2_22 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v22r.mp4").assumeFPS(18).convertToYV12
v2_22 = v2_22.trim(1, v2_22.frameCount - 1)
v2_23 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v23r.mp4").assumeFPS(18)#.spline64Resize(1520, 1080).convertToYV12
v2_23 = v2_23.trim(1, v2_23.frameCount - 2)
v2_24 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v24r.mp4").assumeFPS(18)#.spline64Resize(1520, 1080).convertToYV12
v2_24 = v2_24.trim(1, v2_24.frameCount - 2)
v2_25 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v25r.mp4").assumeFPS(18)#.spline64Resize(1520, 1080).convertToYV12
v2_25 = v2_25.trim(1, v2_25.frameCount - 1)
v2_26 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v26r.mp4").assumeFPS(18)#.spline64Resize(1520, 1080).convertToYV12
v2_26 = v2_26.trim(1, v2_26.frameCount - 2)
v2_27 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v27r.mp4").assumeFPS(18)#.spline64Resize(1520, 1080).convertToYV12
v2_27 = v2_27.trim(1, v2_27.frameCount - 2)
v2_28 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v28r.mp4").assumeFPS(18)#.spline64Resize(1520, 1080).convertToYV12
v2_28 = v2_28.trim(1, v2_28.frameCount - 2)
v2_29 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v29r.mp4").assumeFPS(18)#.spline64Resize(1520, 1080).convertToYV12
v2_29 = v2_29.trim(1, v2_29.frameCount - 2)
v2_30 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v30r.mp4").assumeFPS(18)#.spline64Resize(1520, 1080).convertToYV12
v2_30 = v2_30.trim(0, v2_30.frameCount - 2)
v2_31 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v31r.mp4").assumeFPS(18)#.spline64Resize(1520, 1080).convertToYV12
v2_31 = v2_31.trim(0, v2_31.frameCount - 2)
v2_32 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v32r.mp4").assumeFPS(18)#.spline64Resize(1520, 1080).convertToYV12
v2_32 = v2_32.trim(1, v2_32.frameCount - 2)
v2_33 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v33r.mp4").assumeFPS(18)#.spline64Resize(1520, 1080).convertToYV12
v2_33 = v2_33.trim(1, v2_33.frameCount - 1)
v2_34 = LSMASHVideoSource("\\seiki15\m\media\video\super8\wrk\1987\svatba\v34r.mp4").assumeFPS(18)#.spline64Resize(1520, 1080).convertToYV12
v2_34 = v2_34.trim(1, v2_34.frameCount - 1)

v2 = v2_1  + v2_2  + v2_3  + v2_4  + v2_5  + v2_6  + v2_7  + v2_8  + v2_9  + v2_10 /*+ v2_11*/ + v2_12 +\
     v2_13 + v2_14 + v2_15 + v2_16 + v2_17 + v2_18 + v2_19 + v2_20 + v2_21 + v2_22 + v2_23 + v2_24 +\
     v2_25 + v2_26 + v2_27 + v2_28 + v2_29 + v2_30 + v2_31 + v2_32 + v2_33 + v2_34

v2 = v2.convertToYV24.adjustSize#.autolevels(filterRadius = 0)

v1 = v1.spline64Resize(1920, 1080)
dl = (v1.width - v2.width)/2
dr = (v1.width - v2.width) - dl
v1 = v1.crop(dl, 0, -dr, 0)

v1 = v1.convertToYV24.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=18, NewDen=1, blksize=16)
#v2 = v2.trim(1, 0)

return v1.interleave(v2).histogram("levels")

function adjustSize(clip c, float "sharpness")
{
    sharpness = default(sharpness, 10.)

    w = c.width
    h = c.height
    w = w*1080/h
    w = (w % 2 == 0) ? w : w + 1
    h = 1080

#    return c.height == h ? c : c.spline64Resize(w, h)
    return c.height == h ? c : c.gaussResize(w, h, p = sharpness)
}
