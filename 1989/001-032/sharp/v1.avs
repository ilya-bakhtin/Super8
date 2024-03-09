import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")
v1 = LSMASHVideoSource(dst_dir + "v1rc.mp4")

v1 = v1.convertToYV12(interlaced=false)

#v_ds_0 = v1.deSpot(pwidth=500, pheight=500, mthres=190, sign=1, p1=40, p2=10, color=true, show=0)
v_ds_1 = v1.deSpot(pwidth=500, pheight=500, mthres= 60, sign=1, p1=50, p2=10, color=true, show=0)
v1 = v_ds_1.trim(0, 41) + v1.trim(42, 0)

v1 = v1.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v1 = v1.UnsharpMask(strength=500, radius=5, threshold=1)
v1 = v1.adjustBorders

va = BlankClip(v1, audio_rate = 48000, channels = 2).killVideo
v1 = v1.audioDub(va)

return v1.Prefetch

