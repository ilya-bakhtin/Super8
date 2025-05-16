import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v62 = LSMASHVideoSource(dst_dir + "v62rc.mp4")

v62 = v62.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v62 = v62.convertToYV12(interlaced=false)

v62 = v62.UnsharpMask(strength=500, radius=5, threshold=1)
v62 = v62.adjustBorders

va = BlankClip(v62, audio_rate = 48000, channels = 2).killVideo
v62 = v62.audioDub(va)

return v62.Prefetch

