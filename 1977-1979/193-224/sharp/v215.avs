import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v215 = LSMASHVideoSource(dst_dir + "v215rc.mp4")

v215 = v215.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v215 = v215.convertToYV12(interlaced=false)

v215 = v215.UnsharpMask(strength=500, radius=5, threshold=1)
v215 = v215.adjustBorders

va = BlankClip(v215, audio_rate = 48000, channels = 2).killVideo
v215 = v215.audioDub(va)

return v215.Prefetch

