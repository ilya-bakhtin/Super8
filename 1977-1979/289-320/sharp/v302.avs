import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v302 = LSMASHVideoSource(dst_dir + "v302rc.mp4")

v302 = v302.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v302 = v302.convertToYV12(interlaced=false)

v302 = v302.UnsharpMask(strength=500, radius=5, threshold=1)
v302 = v302.adjustBorders

va = BlankClip(v302, audio_rate = 48000, channels = 2).killVideo
v302 = v302.audioDub(va)

return v302.Prefetch

