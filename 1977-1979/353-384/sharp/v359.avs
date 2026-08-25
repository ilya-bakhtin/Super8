import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v359 = LSMASHVideoSource(dst_dir + "v359rc.mp4")

v359 = v359.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v359 = v359.convertToYV12(interlaced=false)

v359 = v359.UnsharpMask(strength=500, radius=5, threshold=1)
v359 = v359.adjustBorders

va = BlankClip(v359, audio_rate = 48000, channels = 2).killVideo
v359 = v359.audioDub(va)

return v359.Prefetch

