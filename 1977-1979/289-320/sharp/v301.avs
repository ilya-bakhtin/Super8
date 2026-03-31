import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v301 = LSMASHVideoSource(dst_dir + "v301rc.mp4")

v301 = v301.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v301 = v301.convertToYV12(interlaced=false)

v301 = v301.UnsharpMask(strength=500, radius=5, threshold=1)
v301 = v301.adjustBorders

va = BlankClip(v301, audio_rate = 48000, channels = 2).killVideo
v301 = v301.audioDub(va)

return v301.Prefetch

