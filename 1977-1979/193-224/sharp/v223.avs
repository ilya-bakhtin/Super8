import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v223 = LSMASHVideoSource(dst_dir + "v223rc.mp4")

v223 = v223.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v223 = v223.convertToYV12(interlaced=false)

v223 = v223.UnsharpMask(strength=500, radius=5, threshold=1)
v223 = v223.adjustBorders

va = BlankClip(v223, audio_rate = 48000, channels = 2).killVideo
v223 = v223.audioDub(va)

return v223.Prefetch

