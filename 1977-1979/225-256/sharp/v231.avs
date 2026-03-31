import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v231 = LSMASHVideoSource(dst_dir + "v231rc.mp4")

v231 = v231.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v231 = v231.convertToYV12(interlaced=false)

v231 = v231.UnsharpMask(strength=500, radius=5, threshold=1)
v231 = v231.adjustBorders

va = BlankClip(v231, audio_rate = 48000, channels = 2).killVideo
v231 = v231.audioDub(va)

return v231.Prefetch

