import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v338 = LSMASHVideoSource(dst_dir + "v338rc.mp4")

v338 = v338.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v338 = v338.convertToYV12(interlaced=false)

v338 = v338.UnsharpMask(strength=500, radius=5, threshold=1)
v338 = v338.adjustBorders

va = BlankClip(v338, audio_rate = 48000, channels = 2).killVideo
v338 = v338.audioDub(va)

return v338.Prefetch

