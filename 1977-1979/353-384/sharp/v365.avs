import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v365 = LSMASHVideoSource(dst_dir + "v365rc.mp4")

v365 = v365.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v365 = v365.convertToYV12(interlaced=false)

v365 = v365.UnsharpMask(strength=500, radius=5, threshold=1)
v365 = v365.adjustBorders

va = BlankClip(v365, audio_rate = 48000, channels = 2).killVideo
v365 = v365.audioDub(va)

return v365.Prefetch

