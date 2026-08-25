import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v375 = LSMASHVideoSource(dst_dir + "v375rc.mp4")

v375 = v375.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v375 = v375.convertToYV12(interlaced=false)

v375 = v375.UnsharpMask(strength=500, radius=5, threshold=1)
v375 = v375.adjustBorders

va = BlankClip(v375, audio_rate = 48000, channels = 2).killVideo
v375 = v375.audioDub(va)

return v375.Prefetch

