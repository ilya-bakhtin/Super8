import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v149 = LSMASHVideoSource(dst_dir + "v149rc.mp4")

v149 = v149.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v149 = v149.convertToYV12(interlaced=false)

v149 = v149.UnsharpMask(strength=500, radius=5, threshold=1)
v149 = v149.adjustBorders

va = BlankClip(v149, audio_rate = 48000, channels = 2).killVideo
v149 = v149.audioDub(va)

return v149.Prefetch

