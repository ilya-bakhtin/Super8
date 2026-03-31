import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v250 = LSMASHVideoSource(dst_dir + "v250rc.mp4")

v250 = v250.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v250 = v250.convertToYV12(interlaced=false)

v250 = v250.UnsharpMask(strength=500, radius=5, threshold=1)
v250 = v250.adjustBorders

va = BlankClip(v250, audio_rate = 48000, channels = 2).killVideo
v250 = v250.audioDub(va)

return v250.Prefetch

