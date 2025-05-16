import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v141 = LSMASHVideoSource(dst_dir + "v141rc.mp4")

v141 = v141.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v141 = v141.convertToYV12(interlaced=false)

v141 = v141.UnsharpMask(strength=500, radius=5, threshold=1)
v141 = v141.adjustBorders

va = BlankClip(v141, audio_rate = 48000, channels = 2).killVideo
v141 = v141.audioDub(va)

return v141.Prefetch

