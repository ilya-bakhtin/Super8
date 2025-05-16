import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v29 = LSMASHVideoSource(dst_dir + "v29rc.mp4")

v29 = v29.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v29 = v29.convertToYV12(interlaced=false)

v29 = v29.UnsharpMask(strength=500, radius=5, threshold=1)
v29 = v29.adjustBorders

va = BlankClip(v29, audio_rate = 48000, channels = 2).killVideo
v29 = v29.audioDub(va)

return v29.Prefetch

