import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v323 = LSMASHVideoSource(dst_dir + "v323rc.mp4")

v323 = v323.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v323 = v323.convertToYV12(interlaced=false)

v323 = v323.UnsharpMask(strength=500, radius=5, threshold=1)
v323 = v323.adjustBorders

va = BlankClip(v323, audio_rate = 48000, channels = 2).killVideo
v323 = v323.audioDub(va)

return v323.Prefetch

