import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v369 = LSMASHVideoSource(dst_dir + "v369rc.mp4")

v369 = v369.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v369 = v369.convertToYV12(interlaced=false)

v369 = v369.UnsharpMask(strength=500, radius=5, threshold=1)
v369 = v369.adjustBorders

va = BlankClip(v369, audio_rate = 48000, channels = 2).killVideo
v369 = v369.audioDub(va)

return v369.Prefetch

