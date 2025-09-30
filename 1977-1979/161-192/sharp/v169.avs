import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v169 = LSMASHVideoSource(dst_dir + "v169rc.mp4")

v169 = v169.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v169 = v169.convertToYV12(interlaced=false)

v169 = v169.UnsharpMask(strength=500, radius=5, threshold=1)
v169 = v169.adjustBorders

va = BlankClip(v169, audio_rate = 48000, channels = 2).killVideo
v169 = v169.audioDub(va)

return v169.Prefetch

