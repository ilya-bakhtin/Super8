import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v44 = LSMASHVideoSource(dst_dir + "v44rc.mp4")

v44 = v44.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v44 = v44.convertToYV12(interlaced=false)

v44 = v44.UnsharpMask(strength=500, radius=5, threshold=1)
v44 = v44.adjustBorders

va = BlankClip(v44, audio_rate = 48000, channels = 2).killVideo
v44 = v44.audioDub(va)

return v44.Prefetch

