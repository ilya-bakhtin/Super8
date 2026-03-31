import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v226 = LSMASHVideoSource(dst_dir + "v226rc.mp4")

v226 = v226.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v226 = v226.convertToYV12(interlaced=false)

v226 = v226.UnsharpMask(strength=500, radius=5, threshold=1)
v226 = v226.adjustBorders

va = BlankClip(v226, audio_rate = 48000, channels = 2).killVideo
v226 = v226.audioDub(va)

return v226.Prefetch

