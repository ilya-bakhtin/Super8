import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v264 = LSMASHVideoSource(dst_dir + "v264rc.mp4")

v264 = v264.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v264 = v264.convertToYV12(interlaced=false)

v264 = v264.UnsharpMask(strength=500, radius=5, threshold=1)
v264 = v264.adjustBorders

va = BlankClip(v264, audio_rate = 48000, channels = 2).killVideo
v264 = v264.audioDub(va)

return v264.Prefetch

