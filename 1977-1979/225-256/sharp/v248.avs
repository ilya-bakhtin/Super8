import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v248 = LSMASHVideoSource(dst_dir + "v248rc.mp4")

v248 = v248.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v248 = v248.convertToYV12(interlaced=false)

v248 = v248.UnsharpMask(strength=500, radius=5, threshold=1)
v248 = v248.adjustBorders

va = BlankClip(v248, audio_rate = 48000, channels = 2).killVideo
v248 = v248.audioDub(va)

return v248.Prefetch

