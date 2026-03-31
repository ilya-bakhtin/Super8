import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v267 = LSMASHVideoSource(dst_dir + "v267rc.mp4")

v267 = v267.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v267 = v267.convertToYV12(interlaced=false)

v267 = v267.UnsharpMask(strength=500, radius=5, threshold=1)
v267 = v267.adjustBorders

va = BlankClip(v267, audio_rate = 48000, channels = 2).killVideo
v267 = v267.audioDub(va)

return v267.Prefetch

