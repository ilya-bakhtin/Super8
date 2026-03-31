import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v314 = LSMASHVideoSource(dst_dir + "v314rc.mp4")

v314 = v314.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v314 = v314.convertToYV12(interlaced=false)

v314 = v314.UnsharpMask(strength=500, radius=5, threshold=1)
v314 = v314.adjustBorders

va = BlankClip(v314, audio_rate = 48000, channels = 2).killVideo
v314 = v314.audioDub(va)

return v314.Prefetch

