import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v265 = LSMASHVideoSource(dst_dir + "v265rc.mp4")

v265 = v265.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v265 = v265.convertToYV12(interlaced=false)

v265 = v265.UnsharpMask(strength=500, radius=5, threshold=1)
v265 = v265.adjustBorders

va = BlankClip(v265, audio_rate = 48000, channels = 2).killVideo
v265 = v265.audioDub(va)

return v265.Prefetch

