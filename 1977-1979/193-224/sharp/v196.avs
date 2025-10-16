import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v196 = LSMASHVideoSource(dst_dir + "v196rc.mp4")

v196 = v196.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v196 = v196.convertToYV12(interlaced=false)

v196 = v196.UnsharpMask(strength=500, radius=5, threshold=1)
v196 = v196.adjustBorders

va = BlankClip(v196, audio_rate = 48000, channels = 2).killVideo
v196 = v196.audioDub(va)

return v196.Prefetch

