import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v199 = LSMASHVideoSource(dst_dir + "v199rc.mp4")

v199 = v199.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v199 = v199.convertToYV12(interlaced=false)

v199 = v199.UnsharpMask(strength=500, radius=5, threshold=1)
v199 = v199.adjustBorders

va = BlankClip(v199, audio_rate = 48000, channels = 2).killVideo
v199 = v199.audioDub(va)

return v199.Prefetch

