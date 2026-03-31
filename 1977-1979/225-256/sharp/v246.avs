import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v246 = LSMASHVideoSource(dst_dir + "v246rc.mp4")

v246 = v246.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v246 = v246.convertToYV12(interlaced=false)

v246 = v246.UnsharpMask(strength=500, radius=5, threshold=1)
v246 = v246.adjustBorders

va = BlankClip(v246, audio_rate = 48000, channels = 2).killVideo
v246 = v246.audioDub(va)

return v246.Prefetch

