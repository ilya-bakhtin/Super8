import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v327 = LSMASHVideoSource(dst_dir + "v327rc.mp4")

v327 = v327.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v327 = v327.convertToYV12(interlaced=false)

v327 = v327.UnsharpMask(strength=500, radius=5, threshold=1)
v327 = v327.adjustBorders

va = BlankClip(v327, audio_rate = 48000, channels = 2).killVideo
v327 = v327.audioDub(va)

return v327.Prefetch

