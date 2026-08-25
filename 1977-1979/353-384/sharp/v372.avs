import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v372 = LSMASHVideoSource(dst_dir + "v372rc.mp4")

v372 = v372.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v372 = v372.convertToYV12(interlaced=false)

v372 = v372.UnsharpMask(strength=500, radius=5, threshold=1)
v372 = v372.adjustBorders

va = BlankClip(v372, audio_rate = 48000, channels = 2).killVideo
v372 = v372.audioDub(va)

return v372.Prefetch

