import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v152 = LSMASHVideoSource(dst_dir + "v152rc.mp4")

v152 = v152.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v152 = v152.convertToYV12(interlaced=false)

v152 = v152.UnsharpMask(strength=500, radius=5, threshold=1)
v152 = v152.adjustBorders

va = BlankClip(v152, audio_rate = 48000, channels = 2).killVideo
v152 = v152.audioDub(va)

return v152.Prefetch

