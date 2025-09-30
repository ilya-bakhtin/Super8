import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v188 = LSMASHVideoSource(dst_dir + "v188rc.mp4")

v188 = v188.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v188 = v188.convertToYV12(interlaced=false)

v188 = v188.UnsharpMask(strength=500, radius=5, threshold=1)
v188 = v188.adjustBorders

va = BlankClip(v188, audio_rate = 48000, channels = 2).killVideo
v188 = v188.audioDub(va)

return v188.Prefetch

