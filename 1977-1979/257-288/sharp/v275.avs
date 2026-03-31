import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v275 = LSMASHVideoSource(dst_dir + "v275rc.mp4")

v275 = v275.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v275 = v275.convertToYV12(interlaced=false)

v275 = v275.UnsharpMask(strength=500, radius=5, threshold=1)
v275 = v275.adjustBorders

va = BlankClip(v275, audio_rate = 48000, channels = 2).killVideo
v275 = v275.audioDub(va)

return v275.Prefetch

