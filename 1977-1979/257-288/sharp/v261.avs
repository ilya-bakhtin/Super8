import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v261 = LSMASHVideoSource(dst_dir + "v261rc.mp4")

v261 = v261.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v261 = v261.convertToYV12(interlaced=false)

v261 = v261.UnsharpMask(strength=500, radius=5, threshold=1)
v261 = v261.adjustBorders

va = BlankClip(v261, audio_rate = 48000, channels = 2).killVideo
v261 = v261.audioDub(va)

return v261.Prefetch

