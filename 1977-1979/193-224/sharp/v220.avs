import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v220 = LSMASHVideoSource(dst_dir + "v220rc.mp4")

v220 = v220.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v220 = v220.convertToYV12(interlaced=false)

v220 = v220.UnsharpMask(strength=500, radius=5, threshold=1)
v220 = v220.adjustBorders

va = BlankClip(v220, audio_rate = 48000, channels = 2).killVideo
v220 = v220.audioDub(va)

return v220.Prefetch

