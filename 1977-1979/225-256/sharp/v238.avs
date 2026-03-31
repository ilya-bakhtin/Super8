import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v238 = LSMASHVideoSource(dst_dir + "v238rc.mp4")

v238 = v238.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v238 = v238.convertToYV12(interlaced=false)

v238 = v238.UnsharpMask(strength=500, radius=5, threshold=1)
v238 = v238.adjustBorders

va = BlankClip(v238, audio_rate = 48000, channels = 2).killVideo
v238 = v238.audioDub(va)

return v238.Prefetch

