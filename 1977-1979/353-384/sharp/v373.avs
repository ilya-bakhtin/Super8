import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v373 = LSMASHVideoSource(dst_dir + "v373rc.mp4")

v373 = v373.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v373 = v373.convertToYV12(interlaced=false)

v373 = v373.UnsharpMask(strength=500, radius=5, threshold=1)
v373 = v373.adjustBorders

va = BlankClip(v373, audio_rate = 48000, channels = 2).killVideo
v373 = v373.audioDub(va)

return v373.Prefetch

