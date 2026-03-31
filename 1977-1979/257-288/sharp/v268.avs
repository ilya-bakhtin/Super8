import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v268 = LSMASHVideoSource(dst_dir + "v268rc.mp4")

v268 = v268.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v268 = v268.convertToYV12(interlaced=false)

v268 = v268.UnsharpMask(strength=500, radius=5, threshold=1)
v268 = v268.adjustBorders

va = BlankClip(v268, audio_rate = 48000, channels = 2).killVideo
v268 = v268.audioDub(va)

return v268.Prefetch

