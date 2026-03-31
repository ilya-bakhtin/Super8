import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v283 = LSMASHVideoSource(dst_dir + "v283rc.mp4")

v283 = v283.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v283 = v283.convertToYV12(interlaced=false)

v283 = v283.UnsharpMask(strength=500, radius=5, threshold=1)
v283 = v283.adjustBorders

va = BlankClip(v283, audio_rate = 48000, channels = 2).killVideo
v283 = v283.audioDub(va)

return v283.Prefetch

