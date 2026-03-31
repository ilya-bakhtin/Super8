import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v282 = LSMASHVideoSource(dst_dir + "v282rc.mp4")

v282 = v282.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v282 = v282.convertToYV12(interlaced=false)

v282 = v282.UnsharpMask(strength=500, radius=5, threshold=1)
v282 = v282.adjustBorders

va = BlankClip(v282, audio_rate = 48000, channels = 2).killVideo
v282 = v282.audioDub(va)

return v282.Prefetch

