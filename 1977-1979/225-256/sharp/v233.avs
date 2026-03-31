import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v233 = LSMASHVideoSource(dst_dir + "v233rc.mp4")

v233 = v233.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v233 = v233.convertToYV12(interlaced=false)

v233 = v233.UnsharpMask(strength=500, radius=5, threshold=1)
v233 = v233.adjustBorders

va = BlankClip(v233, audio_rate = 48000, channels = 2).killVideo
v233 = v233.audioDub(va)

return v233.Prefetch

