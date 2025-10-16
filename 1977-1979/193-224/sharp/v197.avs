import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v197 = LSMASHVideoSource(dst_dir + "v197rc.mp4")

v197 = v197.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v197 = v197.convertToYV12(interlaced=false)

v197 = v197.UnsharpMask(strength=500, radius=5, threshold=1)
v197 = v197.adjustBorders

va = BlankClip(v197, audio_rate = 48000, channels = 2).killVideo
v197 = v197.audioDub(va)

return v197.Prefetch

