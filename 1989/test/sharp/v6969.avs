import("..\..\..\common.avs")
import("..\..\..\s8_functions.avs")

v6969 = LSMASHVideoSource(dst_dir + "v6969rc.mp4")

v6969 = v6969.convertToYV12(interlaced=false)
v_ds_0 = v6969.deSpot(pwidth=500, pheight=500, mthres=190, sign=1, p1=40, p2=10, color=true, show=0)
v_ds_1 = v6969.deSpot(pwidth=500, pheight=500, mthres= 60, sign=1, p1=50, p2=10, color=true, show=0)
v6969 = v_ds_0.trim(0, 101) + v_ds_1.trim(102, 105) + v_ds_0.trim(106, 145) + v_ds_1.trim(146, 0)

v6969 = v6969.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v6969 = v6969.UnsharpMask(strength=500, radius=5, threshold=1)
#v6969 = v6969.adjustBorders

va = BlankClip(v6969, audio_rate = 48000, channels = 2).killVideo
v6969 = v6969.audioDub(va)

return v6969.Prefetch

