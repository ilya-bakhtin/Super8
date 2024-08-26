import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")
v33 = LSMASHVideoSource(dst_dir + "v33rc.mp4")

v33 = v33.convertToYV12(interlaced=false)

#v_ds_0 = v33.deSpot(pwidth=500, pheight=500, mthres=190, sign=1, p1=40, p2=10, color=true, show=0)
v_ds_1 = v33.deSpot(pwidth=500, pheight=500, mthres= 60, sign=1, p1=50, p2=10, color=true, show=0)
v33 = v_ds_1

v33 = v33.Filter(th_SAD=900, th_SADC=900, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v33 = v33.UnsharpMask(strength=500, radius=5, threshold=1)
v33 = v33.adjustBorders

va = BlankClip(v33, audio_rate = 48000, channels = 2).killVideo
v33 = v33.audioDub(va)

return v33.Prefetch

