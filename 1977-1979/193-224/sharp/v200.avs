import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v200 = LSMASHVideoSource(dst_dir + "v200rc.mp4")

v200 = v200.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v200 = v200.convertToYV12(interlaced=false)

v200 = v200.UnsharpMask(strength=500, radius=5, threshold=1)
v200 = v200.adjustBorders

va = BlankClip(v200, audio_rate = 48000, channels = 2).killVideo
v200 = v200.audioDub(va)

return v200.Prefetch

