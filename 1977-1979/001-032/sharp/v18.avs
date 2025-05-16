import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v18 = LSMASHVideoSource(dst_dir + "v18rc.mp4")

v18 = v18.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v18 = v18.convertToYV12(interlaced=false)

v18 = v18.UnsharpMask(strength=500, radius=5, threshold=1)
v18 = v18.adjustBorders

va = BlankClip(v18, audio_rate = 48000, channels = 2).killVideo
v18 = v18.audioDub(va)

return v18.Prefetch

