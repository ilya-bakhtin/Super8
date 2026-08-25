import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v357 = LSMASHVideoSource(dst_dir + "v357rc.mp4")

v357 = v357.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v357 = v357.convertToYV12(interlaced=false)

v357 = v357.UnsharpMask(strength=500, radius=5, threshold=1)
v357 = v357.adjustBorders

va = BlankClip(v357, audio_rate = 48000, channels = 2).killVideo
v357 = v357.audioDub(va)

return v357.Prefetch

