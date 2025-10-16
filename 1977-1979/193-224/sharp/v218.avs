import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v218 = LSMASHVideoSource(dst_dir + "v218rc.mp4")

v218 = v218.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v218 = v218.convertToYV12(interlaced=false)

v218 = v218.UnsharpMask(strength=500, radius=5, threshold=1)
v218 = v218.adjustBorders

va = BlankClip(v218, audio_rate = 48000, channels = 2).killVideo
v218 = v218.audioDub(va)

return v218.Prefetch

