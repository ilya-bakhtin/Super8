import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v297 = LSMASHVideoSource(dst_dir + "v297rc.mp4")

v297 = v297.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v297 = v297.convertToYV12(interlaced=false)

v297 = v297.UnsharpMask(strength=500, radius=5, threshold=1)
v297 = v297.adjustBorders

va = BlankClip(v297, audio_rate = 48000, channels = 2).killVideo
v297 = v297.audioDub(va)

return v297.Prefetch

