import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v324 = LSMASHVideoSource(dst_dir + "v324rc.mp4")

v324 = v324.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v324 = v324.convertToYV12(interlaced=false)

v324 = v324.UnsharpMask(strength=500, radius=5, threshold=1)
v324 = v324.adjustBorders

va = BlankClip(v324, audio_rate = 48000, channels = 2).killVideo
v324 = v324.audioDub(va)

return v324.Prefetch

