import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")
v25 = LSMASHVideoSource(dst_dir + "v25rc.mp4")

v25 = v25.convertToYV12(interlaced=false)

v_ds_0 = v25.deSpot(pwidth=500, pheight=500, mthres=190, sign=1, p1=40, p2=10, color=true, show=0)
v_ds_1 = v25.deSpot(pwidth=500, pheight=500, mthres= 60, sign=1, p1=50, p2=10, color=true, show=0)
v25 = v_ds_0.trim(0, 101) + v_ds_1.trim(102, 105) + v_ds_0.trim(106, 145) + v_ds_1.trim(146, 0)

v25 = v25.Filter(th_SAD=900, th_SADC=900, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v25 = v25.UnsharpMask(strength=500, radius=5, threshold=1)
v25 = v25.adjustBorders

va = BlankClip(v25, audio_rate = 48000, channels = 2).killVideo
v25 = v25.audioDub(va)

return v25.Prefetch

