import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v260 = LSMASHVideoSource(dst_dir + "v260rc.mp4")

v260 = v260.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v260 = v260.convertToYV12(interlaced=false)

v260 = v260.UnsharpMask(strength=500, radius=5, threshold=1)
v260 = v260.adjustBorders

va = BlankClip(v260, audio_rate = 48000, channels = 2).killVideo
v260 = v260.audioDub(va)

return v260.Prefetch

