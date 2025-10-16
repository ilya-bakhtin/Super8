import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v216 = LSMASHVideoSource(dst_dir + "v216rc.mp4")

v216 = v216.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v216 = v216.convertToYV12(interlaced=false)

v216 = v216.UnsharpMask(strength=500, radius=5, threshold=1)
v216 = v216.adjustBorders

va = BlankClip(v216, audio_rate = 48000, channels = 2).killVideo
v216 = v216.audioDub(va)

return v216.Prefetch

