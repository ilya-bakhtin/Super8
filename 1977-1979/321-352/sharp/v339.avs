import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v339 = LSMASHVideoSource(dst_dir + "v339rc.mp4")

v339 = v339.Filter(th_SAD=600, th_SADC=600, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v339 = v339.convertToYV12(interlaced=false)

v339 = v339.UnsharpMask(strength=300, radius=4, threshold=1)
v339 = v339.adjustBorders

va = BlankClip(v339, audio_rate = 48000, channels = 2).killVideo
v339 = v339.audioDub(va)

return v339.Prefetch

