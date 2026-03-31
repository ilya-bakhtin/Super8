import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v243 = LSMASHVideoSource(dst_dir + "v243rc.mp4")

v243 = v243.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v243 = v243.convertToYV12(interlaced=false)

v243 = v243.UnsharpMask(strength=500, radius=5, threshold=1)
v243 = v243.adjustBorders

va = BlankClip(v243, audio_rate = 48000, channels = 2).killVideo
v243 = v243.audioDub(va)

return v243.Prefetch

