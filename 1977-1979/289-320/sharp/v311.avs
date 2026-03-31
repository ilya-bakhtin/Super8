import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v311 = LSMASHVideoSource(dst_dir + "v311rc.mp4")

v311 = v311.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v311 = v311.convertToYV12(interlaced=false)

v311 = v311.UnsharpMask(strength=500, radius=5, threshold=1)
v311 = v311.adjustBorders

va = BlankClip(v311, audio_rate = 48000, channels = 2).killVideo
v311 = v311.audioDub(va)

return v311.Prefetch

