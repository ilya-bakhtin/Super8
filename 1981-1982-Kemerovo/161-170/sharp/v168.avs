import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v168 = LSMASHVideoSource(dst_dir + "v168rc.mp4")

v168 = v168.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v168 = v168.convertToYV12(interlaced=false)

v168 = v168.UnsharpMask(strength=500, radius=5, threshold=1)
v168 = v168.adjustBorders

va = BlankClip(v168, audio_rate = 48000, channels = 2).killVideo
v168 = v168.audioDub(va)

return v168.Prefetch

