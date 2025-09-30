import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v179 = LSMASHVideoSource(dst_dir + "v179rc.mp4")

v179 = v179.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v179 = v179.convertToYV12(interlaced=false)

v179 = v179.UnsharpMask(strength=500, radius=5, threshold=1)
v179 = v179.adjustBorders

va = BlankClip(v179, audio_rate = 48000, channels = 2).killVideo
v179 = v179.audioDub(va)

return v179.Prefetch

