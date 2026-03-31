import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v245 = LSMASHVideoSource(dst_dir + "v245rc.mp4")

v245 = v245.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v245 = v245.convertToYV12(interlaced=false)

v245 = v245.UnsharpMask(strength=500, radius=5, threshold=1)
v245 = v245.adjustBorders

va = BlankClip(v245, audio_rate = 48000, channels = 2).killVideo
v245 = v245.audioDub(va)

return v245.Prefetch

