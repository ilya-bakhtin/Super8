import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v151 = LSMASHVideoSource(dst_dir + "v151rc.mp4")

v151 = v151.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v151 = v151.convertToYV12(interlaced=false)

v151 = v151.UnsharpMask(strength=500, radius=5, threshold=1)
v151 = v151.adjustBorders

va = BlankClip(v151, audio_rate = 48000, channels = 2).killVideo
v151 = v151.audioDub(va)

return v151.Prefetch

