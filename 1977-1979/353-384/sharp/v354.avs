import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v354 = LSMASHVideoSource(dst_dir + "v354rc.mp4")

v354 = v354.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v354 = v354.convertToYV12(interlaced=false)

v354 = v354.UnsharpMask(strength=500, radius=5, threshold=1)
v354 = v354.adjustBorders

va = BlankClip(v354, audio_rate = 48000, channels = 2).killVideo
v354 = v354.audioDub(va)

return v354.Prefetch

