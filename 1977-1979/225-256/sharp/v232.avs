import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v232 = LSMASHVideoSource(dst_dir + "v232rc.mp4")

v232 = v232.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v232 = v232.convertToYV12(interlaced=false)

v232 = v232.UnsharpMask(strength=500, radius=5, threshold=1)
v232 = v232.adjustBorders

va = BlankClip(v232, audio_rate = 48000, channels = 2).killVideo
v232 = v232.audioDub(va)

return v232.Prefetch

