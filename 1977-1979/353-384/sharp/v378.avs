import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v378 = LSMASHVideoSource(dst_dir + "v378rc.mp4")

v378 = v378.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v378 = v378.convertToYV12(interlaced=false)

v378 = v378.UnsharpMask(strength=500, radius=5, threshold=1)
v378 = v378.adjustBorders

va = BlankClip(v378, audio_rate = 48000, channels = 2).killVideo
v378 = v378.audioDub(va)

return v378.Prefetch

