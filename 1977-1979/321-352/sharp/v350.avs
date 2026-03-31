import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v350 = LSMASHVideoSource(dst_dir + "v350rc.mp4")

v350 = v350.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v350 = v350.convertToYV12(interlaced=false)

v350 = v350.UnsharpMask(strength=500, radius=5, threshold=1)
v350 = v350.adjustBorders

va = BlankClip(v350, audio_rate = 48000, channels = 2).killVideo
v350 = v350.audioDub(va)

return v350.Prefetch

