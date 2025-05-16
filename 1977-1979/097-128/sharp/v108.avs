import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v108 = LSMASHVideoSource(dst_dir + "v108rc.mp4")

v108 = v108.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v108 = v108.convertToYV12(interlaced=false)

v108 = v108.UnsharpMask(strength=500, radius=5, threshold=1)
v108 = v108.adjustBorders

va = BlankClip(v108, audio_rate = 48000, channels = 2).killVideo
v108 = v108.audioDub(va)

return v108.Prefetch

