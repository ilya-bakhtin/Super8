import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v360 = LSMASHVideoSource(dst_dir + "v360rc.mp4")

v360 = v360.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v360 = v360.convertToYV12(interlaced=false)

v360 = v360.UnsharpMask(strength=500, radius=5, threshold=1)
v360 = v360.adjustBorders

va = BlankClip(v360, audio_rate = 48000, channels = 2).killVideo
v360 = v360.audioDub(va)

return v360.Prefetch

