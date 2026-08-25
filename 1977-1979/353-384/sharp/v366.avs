import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v366 = LSMASHVideoSource(dst_dir + "v366rc.mp4")

v366 = v366.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v366 = v366.convertToYV12(interlaced=false)

v366 = v366.UnsharpMask(strength=500, radius=5, threshold=1)
v366 = v366.adjustBorders

va = BlankClip(v366, audio_rate = 48000, channels = 2).killVideo
v366 = v366.audioDub(va)

return v366.Prefetch

