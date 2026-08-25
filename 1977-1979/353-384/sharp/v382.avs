import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v382 = LSMASHVideoSource(dst_dir + "v382rc.mp4")

v382 = v382.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v382 = v382.convertToYV12(interlaced=false)

v382 = v382.UnsharpMask(strength=500, radius=5, threshold=1)
v382 = v382.adjustBorders

va = BlankClip(v382, audio_rate = 48000, channels = 2).killVideo
v382 = v382.audioDub(va)

return v382.Prefetch

