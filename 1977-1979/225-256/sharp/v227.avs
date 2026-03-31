import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v227 = LSMASHVideoSource(dst_dir + "v227rc.mp4")

v227 = v227.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v227 = v227.convertToYV12(interlaced=false)

v227 = v227.UnsharpMask(strength=500, radius=5, threshold=1)
v227 = v227.adjustBorders

va = BlankClip(v227, audio_rate = 48000, channels = 2).killVideo
v227 = v227.audioDub(va)

return v227.Prefetch

