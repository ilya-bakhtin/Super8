import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v150 = LSMASHVideoSource(dst_dir + "v150rc.mp4")

v150 = v150.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v150 = v150.convertToYV12(interlaced=false)

v150 = v150.UnsharpMask(strength=500, radius=5, threshold=1)
v150 = v150.adjustBorders

va = BlankClip(v150, audio_rate = 48000, channels = 2).killVideo
v150 = v150.audioDub(va)

return v150.Prefetch

