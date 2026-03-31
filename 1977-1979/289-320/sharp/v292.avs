import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v292 = LSMASHVideoSource(dst_dir + "v292rc.mp4")

v292 = v292.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v292 = v292.convertToYV12(interlaced=false)

v292 = v292.UnsharpMask(strength=500, radius=5, threshold=1)
v292 = v292.adjustBorders

va = BlankClip(v292, audio_rate = 48000, channels = 2).killVideo
v292 = v292.audioDub(va)

return v292.Prefetch

