import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v210 = LSMASHVideoSource(dst_dir + "v210rc.mp4")

v210 = v210.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v210 = v210.convertToYV12(interlaced=false)

v210 = v210.UnsharpMask(strength=500, radius=5, threshold=1)
v210 = v210.adjustBorders

va = BlankClip(v210, audio_rate = 48000, channels = 2).killVideo
v210 = v210.audioDub(va)

return v210.Prefetch

