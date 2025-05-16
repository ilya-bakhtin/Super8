import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v120 = LSMASHVideoSource(dst_dir + "v120rc.mp4")

v120 = v120.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v120 = v120.convertToYV12(interlaced=false)

v120 = v120.UnsharpMask(strength=500, radius=5, threshold=1)
v120 = v120.adjustBorders

va = BlankClip(v120, audio_rate = 48000, channels = 2).killVideo
v120 = v120.audioDub(va)

return v120.Prefetch

