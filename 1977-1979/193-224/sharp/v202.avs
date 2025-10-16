import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v202 = LSMASHVideoSource(dst_dir + "v202rc.mp4")

v202 = v202.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v202 = v202.convertToYV12(interlaced=false)

v202 = v202.UnsharpMask(strength=500, radius=5, threshold=1)
v202 = v202.adjustBorders

va = BlankClip(v202, audio_rate = 48000, channels = 2).killVideo
v202 = v202.audioDub(va)

return v202.Prefetch

