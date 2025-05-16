import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v19 = LSMASHVideoSource(dst_dir + "v19rc.mp4")

v19 = v19.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v19 = v19.convertToYV12(interlaced=false)

v19 = v19.UnsharpMask(strength=500, radius=5, threshold=1)
v19 = v19.adjustBorders

va = BlankClip(v19, audio_rate = 48000, channels = 2).killVideo
v19 = v19.audioDub(va)

return v19.Prefetch

