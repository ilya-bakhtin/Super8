import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v9 = LSMASHVideoSource(dst_dir + "v9rc.mp4")

v9 = v9.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v9 = v9.convertToYV12(interlaced=false)

v9 = v9.UnsharpMask(strength=500, radius=5, threshold=1)
v9 = v9.adjustBorders

va = BlankClip(v9, audio_rate = 48000, channels = 2).killVideo
v9 = v9.audioDub(va)

return v9.Prefetch

