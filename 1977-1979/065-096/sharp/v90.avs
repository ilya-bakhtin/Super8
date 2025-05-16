import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v90 = LSMASHVideoSource(dst_dir + "v90rc.mp4")

v90 = v90.Filter(th_SAD=400, th_SADC=400, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v90 = v90.convertToYV12(interlaced=false)

v90 = v90.UnsharpMask(strength=500, radius=5, threshold=1)
v90 = v90.adjustBorders

va = BlankClip(v90, audio_rate = 48000, channels = 2).killVideo
v90 = v90.audioDub(va)

return v90.Prefetch

