import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v239 = LSMASHVideoSource(dst_dir + "v239rc.mp4")

v239 = v239.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v239 = v239.convertToYV12(interlaced=false)

v239 = v239.UnsharpMask(strength=500, radius=5, threshold=1)
v239 = v239.adjustBorders

va = BlankClip(v239, audio_rate = 48000, channels = 2).killVideo
v239 = v239.audioDub(va)

return v239.Prefetch

