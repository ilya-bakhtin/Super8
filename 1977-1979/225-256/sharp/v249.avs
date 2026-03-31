import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v249 = LSMASHVideoSource(dst_dir + "v249rc.mp4")

v249 = v249.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v249 = v249.convertToYV12(interlaced=false)

v249 = v249.UnsharpMask(strength=500, radius=5, threshold=1)
v249 = v249.adjustBorders

va = BlankClip(v249, audio_rate = 48000, channels = 2).killVideo
v249 = v249.audioDub(va)

return v249.Prefetch

