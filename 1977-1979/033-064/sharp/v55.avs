import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v55 = LSMASHVideoSource(dst_dir + "v55rc.mp4")

v55 = v55.Filter(th_SAD=500, th_SADC=500, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v55 = v55.convertToYV12(interlaced=false)

v55 = v55.UnsharpMask(strength=500, radius=5, threshold=1)
v55 = v55.adjustBorders

va = BlankClip(v55, audio_rate = 48000, channels = 2).killVideo
v55 = v55.audioDub(va)

return v55.Prefetch

