import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v240 = LSMASHVideoSource(dst_dir + "v240rc.mp4")

v240 = v240.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v240 = v240.convertToYV12(interlaced=false)

v240 = v240.UnsharpMask(strength=500, radius=5, threshold=1)
v240 = v240.adjustBorders

va = BlankClip(v240, audio_rate = 48000, channels = 2).killVideo
v240 = v240.audioDub(va)

return v240.Prefetch

