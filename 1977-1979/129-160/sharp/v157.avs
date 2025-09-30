import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v157 = LSMASHVideoSource(dst_dir + "v157rc.mp4")

v157 = v157.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v157 = v157.convertToYV12(interlaced=false)

v157 = v157.UnsharpMask(strength=500, radius=5, threshold=1)
v157 = v157.adjustBorders

va = BlankClip(v157, audio_rate = 48000, channels = 2).killVideo
v157 = v157.audioDub(va)

return v157.Prefetch

