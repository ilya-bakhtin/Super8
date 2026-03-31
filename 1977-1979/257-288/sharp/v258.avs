import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v258 = LSMASHVideoSource(dst_dir + "v258rc.mp4")

v258 = v258.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v258 = v258.convertToYV12(interlaced=false)

v258 = v258.UnsharpMask(strength=500, radius=5, threshold=1)
v258 = v258.adjustBorders

va = BlankClip(v258, audio_rate = 48000, channels = 2).killVideo
v258 = v258.audioDub(va)

return v258.Prefetch

