import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v237 = LSMASHVideoSource(dst_dir + "v237rc.mp4")

v237 = v237.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v237 = v237.convertToYV12(interlaced=false)

v237 = v237.UnsharpMask(strength=500, radius=5, threshold=1)
v237 = v237.adjustBorders

va = BlankClip(v237, audio_rate = 48000, channels = 2).killVideo
v237 = v237.audioDub(va)

return v237.Prefetch

