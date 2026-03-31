import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v285 = LSMASHVideoSource(dst_dir + "v285rc.mp4")

v285 = v285.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v285 = v285.convertToYV12(interlaced=false)

v285 = v285.UnsharpMask(strength=500, radius=5, threshold=1)
v285 = v285.adjustBorders

va = BlankClip(v285, audio_rate = 48000, channels = 2).killVideo
v285 = v285.audioDub(va)

return v285.Prefetch

