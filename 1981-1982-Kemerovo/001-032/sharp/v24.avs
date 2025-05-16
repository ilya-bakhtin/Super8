import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v24 = LSMASHVideoSource(dst_dir + "v24rc.mp4")

v24 = v24.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v24 = v24.convertToYV12(interlaced=false)

v24 = v24.UnsharpMask(strength=500, radius=5, threshold=1)
v24 = v24.adjustBorders

va = BlankClip(v24, audio_rate = 48000, channels = 2).killVideo
v24 = v24.audioDub(va)

return v24.Prefetch

