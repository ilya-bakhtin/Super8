import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v306 = LSMASHVideoSource(dst_dir + "v306rc.mp4")

v306 = v306.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v306 = v306.convertToYV12(interlaced=false)

v306 = v306.UnsharpMask(strength=500, radius=5, threshold=1)
v306 = v306.adjustBorders

va = BlankClip(v306, audio_rate = 48000, channels = 2).killVideo
v306 = v306.audioDub(va)

return v306.Prefetch

