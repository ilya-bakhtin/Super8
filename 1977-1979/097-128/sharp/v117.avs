import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v117 = LSMASHVideoSource(dst_dir + "v117rc.mp4")

v117 = v117.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v117 = v117.convertToYV12(interlaced=false)

v117 = v117.UnsharpMask(strength=500, radius=5, threshold=1)
v117 = v117.adjustBorders

va = BlankClip(v117, audio_rate = 48000, channels = 2).killVideo
v117 = v117.audioDub(va)

return v117.Prefetch

