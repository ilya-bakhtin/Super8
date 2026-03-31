import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v318 = LSMASHVideoSource(dst_dir + "v318rc.mp4")

v318 = v318.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v318 = v318.convertToYV12(interlaced=false)

v318 = v318.UnsharpMask(strength=500, radius=5, threshold=1)
v318 = v318.adjustBorders

va = BlankClip(v318, audio_rate = 48000, channels = 2).killVideo
v318 = v318.audioDub(va)

return v318.Prefetch

