import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")
v21 = LSMASHVideoSource(dst_dir + "v21rc.mp4")


v21 = v21.convertToYV12(interlaced=false)

#v_ds_0 = v21.deSpot(pwidth=500, pheight=500, mthres=190, sign=1, p1=40, p2=10, color=true, show=0)
v_ds_1 = v21.deSpot(pwidth=500, pheight=500, mthres= 60, sign=1, p1=50, p2=10, color=true, show=0)
v21 = v_ds_1

v21 = v21.Filter(th_SAD=900, th_SADC=900, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v21 = v21.UnsharpMask(strength=500, radius=5, threshold=1)
v21 = v21.adjustBorders

va = BlankClip(v21, audio_rate = 48000, channels = 2).killVideo
v21 = v21.audioDub(va)

return v21.Prefetch

