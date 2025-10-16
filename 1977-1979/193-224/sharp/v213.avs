import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v213 = LSMASHVideoSource(dst_dir + "v213rc.mp4")

v213 = v213.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v213 = v213.convertToYV12(interlaced=false)

v213 = v213.UnsharpMask(strength=500, radius=5, threshold=1)
v213 = v213.adjustBorders

va = BlankClip(v213, audio_rate = 48000, channels = 2).killVideo
v213 = v213.audioDub(va)

return v213.Prefetch

