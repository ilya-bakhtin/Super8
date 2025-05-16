import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v145 = LSMASHVideoSource(dst_dir + "v145rc.mp4")

v145 = v145.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v145 = v145.convertToYV12(interlaced=false)

v145 = v145.UnsharpMask(strength=500, radius=5, threshold=1)
v145 = v145.adjustBorders

va = BlankClip(v145, audio_rate = 48000, channels = 2).killVideo
v145 = v145.audioDub(va)

return v145.Prefetch

