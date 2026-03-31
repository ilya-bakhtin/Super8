import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v284 = LSMASHVideoSource(dst_dir + "v284rc.mp4")

v284 = v284.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v284 = v284.convertToYV12(interlaced=false)

v284 = v284.UnsharpMask(strength=500, radius=5, threshold=1)
v284 = v284.adjustBorders

va = BlankClip(v284, audio_rate = 48000, channels = 2).killVideo
v284 = v284.audioDub(va)

return v284.Prefetch

