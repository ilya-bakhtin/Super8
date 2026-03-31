import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v346 = LSMASHVideoSource(dst_dir + "v346rc.mp4")

v346 = v346.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v346 = v346.convertToYV12(interlaced=false)

v346 = v346.UnsharpMask(strength=500, radius=5, threshold=1)
v346 = v346.adjustBorders

va = BlankClip(v346, audio_rate = 48000, channels = 2).killVideo
v346 = v346.audioDub(va)

return v346.Prefetch

