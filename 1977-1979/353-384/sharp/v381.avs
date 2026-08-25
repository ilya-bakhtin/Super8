import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v381 = LSMASHVideoSource(dst_dir + "v381rc.mp4")

v381 = v381.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v381 = v381.convertToYV12(interlaced=false)

v381 = v381.UnsharpMask(strength=500, radius=5, threshold=1)
v381 = v381.adjustBorders

va = BlankClip(v381, audio_rate = 48000, channels = 2).killVideo
v381 = v381.audioDub(va)

return v381.Prefetch

