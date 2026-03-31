import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v313 = LSMASHVideoSource(dst_dir + "v313rc.mp4")

v313 = v313.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v313 = v313.convertToYV12(interlaced=false)

v313 = v313.UnsharpMask(strength=500, radius=5, threshold=1)
v313 = v313.adjustBorders

va = BlankClip(v313, audio_rate = 48000, channels = 2).killVideo
v313 = v313.audioDub(va)

return v313.Prefetch

